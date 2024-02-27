class Cita {
  final int id;
  final String nombrePaciente;
  final DateTime fechaCita;
  final String doctorAtencion;
  final String especialidad;

  Cita({
    required this.id,
    required this.nombrePaciente,
    required this.fechaCita,
    required this.doctorAtencion,
    required this.especialidad,
  });

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      id: json['id'],
      nombrePaciente: json['nombre_paciente'],
      fechaCita: DateTime.parse(json['fecha_cita']),
      doctorAtencion: json['doctor_atencion'],
      especialidad: json['especialidad'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_paciente': nombrePaciente,
      'fecha_cita': fechaCita.toIso8601String(),
      'doctor_atencion': doctorAtencion,
      'especialidad': especialidad,
    };
  }
}