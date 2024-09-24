import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ConsultarEstoqueScreen extends StatelessWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: LinearBorder.bottom(
            side: const BorderSide(color: Colors.black, width: 2)),
        title: const Text('Consultar Estoque', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Constants.appBarBackground,
        foregroundColor: Constants.appBarForeground,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Consultar estoque'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Constants.background,
        child: const Center(
          child: Text('Tela de Consulta de Estoque'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.buttonBackground,
        foregroundColor: Colors.white,
        child: const Icon(Icons.search),
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
