import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/ajustar_contagem_screen.dart';
import '../screens/conferencia_screen.dart';
import '../screens/consultar_estoque_screen.dart';

class BottomNavigator extends StatefulWidget {
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

int _selectedIndex = 0;

class _BottomNavigatorState extends State<BottomNavigator> {

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
              child: const ConferenciaScreen(), type: PageTransitionType.fade));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
