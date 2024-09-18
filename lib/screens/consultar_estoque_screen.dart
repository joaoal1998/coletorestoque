import 'package:flutter/material.dart';

class ConsultarEstoqueScreen extends StatelessWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar Estoque', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow[50],
        child: const Center(
          child: Text('Tela de Consulta de Estoque'),
        ),
      ),
    );
  }
}
