
import 'package:flutter/material.dart';
import '../models/correo_model.dart';

class Ejercicio2Screen extends StatefulWidget {
  const Ejercicio2Screen({super.key});

  @override
  State<Ejercicio2Screen> createState() =>
      _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController correoController =
      TextEditingController();

  // Variable para almacenar el modelo
  CorreoModel? correo;

  @override
  void dispose() {
    correoController.dispose();
    super.dispose();
  }

  // Método para registrar el correo
  void registrar() {

    if (_formKey.currentState!.validate()) {

      // Crear objeto del modelo
      correo = CorreoModel(
        correo: correoController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Correo registrado correctamente'),
          backgroundColor: Colors.green,
        ),
      );

      print('Correo registrado: ${correo!.correo}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2 - Correo'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Icon(
                Icons.email,
                size: 80,
                color: Colors.pink,
              ),

              const SizedBox(height: 20),

              const Text(
                'REGISTRO DE CORREO ELECTRÓNICO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              TextFormField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: 'Ingrese su correo',
                  hintText: 'ejemplo@gmail.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),

                // Validación del correo
                validator: (value) {

                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains('@')) {
                    return 'Ingrese un correo válido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: registrar,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),

                child: const Text(
                  'REGISTRAR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
