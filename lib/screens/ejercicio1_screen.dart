
import 'package:flutter/material.dart';
import '../models/nombre_model.dart';

class Ejercicio1Screen extends StatefulWidget {
  const Ejercicio1Screen({super.key});

  @override
  State<Ejercicio1Screen> createState() =>
      _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nombreController =
      TextEditingController();

  // Variable para almacenar el objeto
  NombreModel? nombre;

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  // Método para registrar
  void registrar() {

    if (_formKey.currentState!.validate()) {

      // Llamamos al modelo y utilizamos su constructor
      nombre = NombreModel(
        nombre: nombreController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green,
        ),
      );

      print('Nombre registrado: ${nombre!.nombre}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1 - Nombres'),
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
                Icons.person,
                size: 80,
                color: Colors.pink,
              ),

              const SizedBox(height: 20),

              const Text(
                'REGISTRO DE NOMBRES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // Campo de nombre
              TextFormField(
                controller: nombreController,

                decoration: const InputDecoration(
                  labelText: 'Ingrese su nombre',
                  hintText: 'Escriba su nombre completo',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su nombre';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // Botón registrar
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
