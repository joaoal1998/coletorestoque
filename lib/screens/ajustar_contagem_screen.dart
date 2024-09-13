import 'package:flutter/material.dart';

class AjustarContagemScreen extends StatefulWidget {
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
      Navigator.pushReplacementNamed(context, '/consultarEstoque');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/ajustarContagem');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/conferencia');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustar Contagem', textAlign: TextAlign.center),
      ),
      body: Center(
        child: Text('Tela de Ajuste de Contagem'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
