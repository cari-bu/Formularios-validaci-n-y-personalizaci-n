
import 'package:flutter/material.dart';
import 'screens/ejercicio1_screen.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Práctica Formularios',

      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),

      home: const Ejercicio1Screen(),
    );
  }
}
