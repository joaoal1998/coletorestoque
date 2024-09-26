import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/CampoTextual.dart';

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  State<ConsultarEstoqueScreen> createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
  final _codigodebarras = TextEditingController();
  final _marca = TextEditingController();
  final _departamento = TextEditingController();
  final _secao = TextEditingController();
  final _fornecedor = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            TextFieldScreen(
                textoController: _codigodebarras, textoTip: "Código de barras"),
            const SizedBox(height: 10),
            TextFieldScreen(
                textoController: _departamento, textoTip: "Departamento"),
            const SizedBox(height: 10),
            TextFieldScreen(
                textoController: _secao, textoTip: "Seção"),
            const SizedBox(height: 10),
            TextFieldScreen(
                textoController: _fornecedor, textoTip: "Fornecedor"),
            const SizedBox(height: 10),
            TextFieldScreen(
                textoController: _marca, textoTip: "Marca"),
          ],
        ),
      ),
    );
  }
}
