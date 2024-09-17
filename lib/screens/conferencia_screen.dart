import 'package:flutter/material.dart';
import '../utils/navigator.dart';

class ConferenciaScreen extends StatefulWidget {
  const ConferenciaScreen({super.key});

  @override
  _ConferenciaScreenState createState() => _ConferenciaScreenState();
}

class _ConferenciaScreenState extends State<ConferenciaScreen> {
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
        bottomNavigationBar: BottomNavigator());
  }
}
