import 'package:flutter/material.dart';

class ConferenciaScreen extends StatefulWidget {
  @override
  _ConferenciaScreenState createState() => _ConferenciaScreenState();
}

class _ConferenciaScreenState extends State<ConferenciaScreen> {
  int _selectedIndex = 2;

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
        title: const Text('Conferência', textAlign: TextAlign.center),
      ),
      body: Center(
        child: Text('Tela de Conferência'),
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
