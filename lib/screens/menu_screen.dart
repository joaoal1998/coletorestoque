import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 3;
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
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kinitos Festas', textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/estoque.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consultarEstoque');
              },
              child: Text('Consultar Estoque'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ajustarContagem');
              },
              child: Text('Ajustar Contagem'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/conferencia');
              },
              child: Text('Conferência'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Sair'),
            ),
          ],
        ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
