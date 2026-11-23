
import 'package:flutter/material.dart';
import '../models/edad_model.dart';

class Ejercicio3Screen extends StatefulWidget {
  const Ejercicio3Screen({super.key});

  @override
  State<Ejercicio3Screen> createState() =>
      _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController edadController =
      TextEditingController();

  EdadModel? edad;

  @override
  void dispose() {
    edadController.dispose();
    super.dispose();
  }

  void registrar() {

    if (_formKey.currentState!.validate()) {

      edad = EdadModel(
        edad: int.parse(edadController.text.trim()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Edad registrada correctamente'),
          backgroundColor: Colors.green,
        ),
      );

      print('Edad registrada: ${edad!.edad}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3 - Edad'),
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
                Icons.cake,
                size: 80,
                color: Colors.pink,
              ),

              const SizedBox(height: 20),

              const Text(
                'REGISTRO DE EDAD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              TextFormField(
                controller: edadController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: 'Ingrese su edad',
                  hintText: 'Ejemplo: 20',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su edad';
                  }

                  if (int.tryParse(value.trim()) == null) {
                    return 'Ingrese solamente números';
                  }

                  if (int.parse(value.trim()) < 18) {
                    return 'Debe ser mayor o igual a 18 años';
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
