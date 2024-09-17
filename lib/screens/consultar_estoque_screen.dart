import 'package:flutter/material.dart';
import '../utils/navigator.dart';

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  _ConsultarEstoqueScreenState createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Consultar Estoque', textAlign: TextAlign.center),
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.yellow[50],
          child: const Center(
            child: Text('Tela de Consulta de Estoque'),
          ),
        ),
        bottomNavigationBar: BottomNavigator());
  }
}
