import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/campo_textual.dart';
import '../utils/campo_menu.dart';

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  State<ConsultarEstoqueScreen> createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
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
      body: Container(
        color: Constants.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Image.asset(Constants.logo, height: 150),
            const SizedBox(height: 25),
            const TextFieldScreen(textoTip: "Código de barras"),
            const SizedBox(height: 25),
            DropDownScreen(
              dropOpcoes: const [
                'Bomboniere',
                'Confeitaria',
                'Festas',
                'Decoração'
              ],
              labelCampo: 'Departamento',
            ),
            const SizedBox(height: 25),
            DropDownScreen(
              dropOpcoes: const ['secao 1', 'secao 2', 'secao 3'],
              labelCampo: 'Seção',
            ),
            const SizedBox(height: 25),
            DropDownScreen(
                dropOpcoes: const ['marca 1', 'marca 2'], labelCampo: 'Marca')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Constants.details,
        foregroundColor: Colors.white,
        child: const Icon(Icons.search),
      ),
    );
  }
}
