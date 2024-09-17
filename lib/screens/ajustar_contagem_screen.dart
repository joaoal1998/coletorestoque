import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'consultar_estoque_screen.dart';
import 'conferencia_screen.dart';

class AjustarContagemScreen extends StatefulWidget {
  const AjustarContagemScreen({super.key});

  @override
  _AjustarContagemScreenState createState() => _AjustarContagemScreenState();
}

class _AjustarContagemScreenState extends State<AjustarContagemScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
          context,
          PageTransition(
              child: const ConsultarEstoqueScreen(),
              type: PageTransitionType.fade));
    } else if (index == 1) {
      Navigator.push(
          context,
          PageTransition(
              child: const AjustarContagemScreen(),
              type: PageTransitionType.fade));
    } else if (index == 2) {
      Navigator.push(
          context,
          PageTransition(
              child: const ConferenciaScreen(),
              type: PageTransitionType.fade));
    }
  }

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Estoque',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Contagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Conferência',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
