import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
            Image.asset('assets/estoque.png'), // Imagem do menu
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consultarEstoque');
              },
              child: const Text('Consultar Estoque'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ajustarContagem');
              },
              child: const Text('Ajustar Contagem'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/conferencia');
              },
              child: const Text('Conferência'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
