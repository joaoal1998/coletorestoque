import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ConsultarEstoqueScreen extends StatelessWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar Estoque', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Constants.appBarBackground,
        foregroundColor: Constants.appBarForeground,
      ),
      body: Container(
        color: Constants.background,
        child: const Center(
          child: Text('Tela de Consulta de Estoque'),
        ),
      ),
    );
  }
}
