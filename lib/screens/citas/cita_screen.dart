import 'package:confiamedtest/models/cita_model.dart';
import 'package:confiamedtest/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

class CitaScreen extends StatefulWidget {
  const CitaScreen({Key? key}) : super(key: key);

  @override
  _CitaScreenState createState() => _CitaScreenState();
}

class _CitaScreenState extends State<CitaScreen> {
  final Cita cita = Cita(
    id: 0,
    nombrePaciente: "",
    fechaCita: DateTime.now(),
    doctorAtencion: '',
    especialidad: '',
  );

  // Crear controladores para los campos de texto
  final nombrePacienteController = TextEditingController();
  final fechaCitaController = TextEditingController();
  final doctorAtencionController = TextEditingController();
  final especialidadController = TextEditingController();

  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nombrePacienteController.dispose();
    fechaCitaController.dispose();
    doctorAtencionController.dispose();
    especialidadController.dispose();
    super.dispose();
  }

  void _verificarCamposVacios() {
    if (nombrePacienteController.text.isNotEmpty &&
        fechaCitaController.text.isNotEmpty &&
        doctorAtencionController.text.isNotEmpty &&
        especialidadController.text.isNotEmpty) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cita'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.values[0],
            children: [
              const Text('Crear Cita'),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nombrePacienteController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del paciente',
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: fechaCitaController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de la cita',
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: doctorAtencionController,
                decoration: const InputDecoration(
                  labelText: 'Doctor de atención',
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: especialidadController,
                decoration: const InputDecoration(
                  labelText: 'Especialidad',
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isButtonDisabled,
                child: ElevatedButton(
                  onPressed: () {
                    print('Crear cita');
                  },
                  child: const Text('Crear Cita'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(
        currentIndex: 2,
      ),
    );
  }
}
