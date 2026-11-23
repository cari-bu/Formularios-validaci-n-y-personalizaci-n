
import 'package:flutter/material.dart';
import '../models/password_model.dart';

class Ejercicio5Screen extends StatefulWidget {
  const Ejercicio5Screen({super.key});

  @override
  State<Ejercicio5Screen> createState() => _Ejercicio5ScreenState();
}

class _Ejercicio5ScreenState extends State<Ejercicio5Screen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  PasswordModel? passwordRegistrado;

  void registrarPassword() {
    if (_formKey.currentState!.validate()) {
      passwordRegistrado = PasswordModel(
        password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña registrada correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5 - Contraseña'),
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
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su contraseña';
                  }

                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: registrarPassword,
                child: const Text('REGISTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
