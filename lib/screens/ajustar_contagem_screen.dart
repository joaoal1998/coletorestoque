import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AjustarContagemScreen extends StatelessWidget {
  const AjustarContagemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: LinearBorder.bottom(
            side: const BorderSide(color: Colors.black, width: 2)),
        title: const Text('Ajustar Contagem', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Constants.appBarBackground,
        foregroundColor: Constants.appBarForeground,
      ),
      body: Container(
        color: Constants.background,
        child: const Center(
          child: Text('Tela de Ajuste de Contagem'),
        ),
      ),
    );
  }
}
