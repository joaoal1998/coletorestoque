import 'package:flutter/material.dart';

class ConferenciaScreen extends StatelessWidget {
  const ConferenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conferência', textAlign: TextAlign.center),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow[50],
        child: const Center(
          child: Text('Tela de Conferência'),
        ),
      ),
    );
  }
}
