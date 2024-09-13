import 'package:flutter/material.dart';

class AjustarContagemScreen extends StatelessWidget {
  const AjustarContagemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustar Contagem', textAlign: TextAlign.center),
      ),
      body: const Center(
        child: Text('Tela de Ajuste de Contagem'),
      ),
    );
  }
}
