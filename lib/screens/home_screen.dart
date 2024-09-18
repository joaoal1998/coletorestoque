import 'package:flutter/material.dart';
import 'ajustar_contagem_screen.dart';
import 'conferencia_screen.dart';
import 'consultar_estoque_screen.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  final int paginaInicial;
  const HomeScreen({super.key, this.paginaInicial = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int paginaAtual;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    paginaAtual = widget.paginaInicial;
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
        selectedItemColor: Colors.yellow,
        selectedLabelStyle: const TextStyle(color: Colors.yellow),
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
            backgroundColor: Colors.deepOrangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Estoque',
            backgroundColor: Colors.deepOrangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Contagem',
            backgroundColor: Colors.deepOrangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Conferência',
            backgroundColor: Colors.deepOrangeAccent,
          ),
        ],
      ),
    );
  }
}
