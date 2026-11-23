
import 'package:flutter/material.dart';
import '../models/estudiante_model.dart';

class Ejercicio6Screen extends StatefulWidget {
  const Ejercicio6Screen({super.key});

  @override
  State<Ejercicio6Screen> createState() => _Ejercicio6ScreenState();
}

class _Ejercicio6ScreenState extends State<Ejercicio6Screen> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final correoController = TextEditingController();

  EstudianteModel? estudianteRegistrado;

  void registrarEstudiante() {
    if (_formKey.currentState!.validate()) {
      estudianteRegistrado = EstudianteModel(
        nombre: nombreController.text.trim(),
        apellido: apellidoController.text.trim(),
        correo: correoController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Estudiante registrado exitosamente'),
          backgroundColor: Colors.green,
        ),
      );

      setState(() {});
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 6 - Estudiantes'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Icon(
                Icons.school,
                size: 80,
                color: Colors.pink,
              ),

              const SizedBox(height: 15),

              const Text(
                'REGISTRO DE ESTUDIANTES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // CAMPO NOMBRE
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // CAMPO APELLIDO
              TextFormField(
                controller: apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su apellido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // CAMPO CORREO
              TextFormField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su correo';
                  }

                  if (!value.contains('@')) {
                    return 'Ingrese un correo válido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // BOTÓN REGISTRAR
              ElevatedButton(
                onPressed: registrarEstudiante,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  'REGISTRAR',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              // MOSTRAR DATOS REGISTRADOS
              if (estudianteRegistrado != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DATOS DEL ESTUDIANTE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text('Nombre: ${estudianteRegistrado!.nombre}'),
                        Text('Apellido: ${estudianteRegistrado!.apellido}'),
                        Text('Correo: ${estudianteRegistrado!.correo}'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
