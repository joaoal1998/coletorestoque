import 'package:flutter/material.dart';

class ConferenciaScreen extends StatelessWidget {
  const ConferenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conferência', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text('Tela de Conferência'),
        ),
      ),
    );
  }
}
