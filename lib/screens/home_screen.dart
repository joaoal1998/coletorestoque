import 'package:flutter/material.dart';
import 'ajustar_contagem_screen.dart';
import 'conferencia_screen.dart';
import 'consultar_estoque_screen.dart';
import 'menu_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setPaginaAtual,
        controller: pc,
        children: const [
          MenuScreen(),
          ConsultarEstoqueScreen(),
          AjustarContagemScreen(),
          ConferenciaScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.orangeAccent,
        selectedLabelStyle: const TextStyle(color: Colors.orangeAccent),
        unselectedLabelStyle: const TextStyle(color: Colors.orangeAccent),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: paginaAtual,
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
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
      ),
    );
  }
}
