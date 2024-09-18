import 'package:flutter/material.dart';

class AjustarContagemScreen extends StatelessWidget {
  const AjustarContagemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustar Contagem', textAlign: TextAlign.center),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow[50],
        child: const Center(
          child: Text('Tela de Ajuste de Contagem'),
        ),
      ),
    );
  }
}
