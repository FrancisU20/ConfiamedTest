import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:confiamedtest/models/cita_model.dart';

class CitaProvider extends ChangeNotifier {
  late Database _db;

  CitaProvider() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    _db = await openDatabase(
      path.join(await getDatabasesPath(), 'citas_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE citas(id INTEGER PRIMARY KEY, nombre_paciente TEXT, fecha_cita TEXT, doctor_atencion TEXT, especialidad TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> loadCitasFromEndpoint(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> citasJson = jsonDecode(response.body);
      final List<Cita> citas =
          citasJson.map((json) => Cita.fromJson(json)).toList();
      await saveCitas(citas);
    } else {
      throw Exception('Failed to load citas from endpoint');
    }
  }

  Future<void> saveCitas(List<Cita> citas) async {
    final Batch batch = _db.batch();
    for (var cita in citas) {
      batch.insert(
        'citas',
        cita.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
    notifyListeners();
  }

  Future<List<Cita>> getCitas() async {
    final List<Map<String, dynamic>> maps = await _db.query('citas');
    return List.generate(maps.length, (i) {
      return Cita(
        id: maps[i]['id'],
        nombrePaciente: maps[i]['nombre_paciente'],
        fechaCita: DateTime.parse(maps[i]['fecha_cita']),
        doctorAtencion: maps[i]['doctor_atencion'],
        especialidad: maps[i]['especialidad'],
      );
    });
  }

  Future<void> deleteCita(int id) async {
    await _db.delete(
      'citas',
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
  }
}
