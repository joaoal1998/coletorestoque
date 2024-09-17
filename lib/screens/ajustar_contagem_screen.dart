import 'package:flutter/material.dart';
import '../utils/navigator.dart';

class AjustarContagemScreen extends StatefulWidget {
  const AjustarContagemScreen({super.key});

  @override
  _AjustarContagemScreenState createState() => _AjustarContagemScreenState();
}

class _AjustarContagemScreenState extends State<AjustarContagemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustar Contagem', textAlign: TextAlign.center),
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.yellow[50],
          child: const Center(
            child: Text('Tela de Ajuste de Contagem'),
          ),
        ),
        bottomNavigationBar: BottomNavigator());
  }
}
