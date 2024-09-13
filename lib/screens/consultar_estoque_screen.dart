import 'package:flutter/material.dart';

class ConsultarEstoqueScreen extends StatelessWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar Estoque', textAlign: TextAlign.center),
      ),
      body: const Center(
        child: Text('Tela de Consulta de Estoque'),
      ),
    );
  }
}
