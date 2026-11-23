
import 'package:flutter/material.dart';
import '../models/dni_model.dart';

class Ejercicio4Screen extends StatefulWidget {
  const Ejercicio4Screen({super.key});

  @override
  State<Ejercicio4Screen> createState() => _Ejercicio4ScreenState();
}

class _Ejercicio4ScreenState extends State<Ejercicio4Screen> {
  final _formKey = GlobalKey<FormState>();
  final dniController = TextEditingController();

  DniModel? dniRegistrado;

  void registrarDni() {
    if (_formKey.currentState!.validate()) {
      dniRegistrado = DniModel(
        dni: dniController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('DNI registrado correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4 - DNI'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: dniController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su DNI',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su DNI';
                  }

                  if (!RegExp(r'^[0-9]{8}$').hasMatch(value)) {
                    return 'DNI incorrecto';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: registrarDni,
                child: const Text('REGISTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
