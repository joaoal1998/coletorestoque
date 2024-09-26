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
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Bomboniere', 'Confeitaria', 'Festas'];

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
            TextFieldScreen(
                textoController: _codigodebarras, textoTip: "Código de barras"),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: "Departamento",
                        floatingLabelStyle: TextStyle(
                          color: Constants.details,
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Constants.details, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text("Selecione o departamento"),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) => dropValue.value = escolha.toString(),
                    items: dropOpcoes
                        .map(
                          (op) => DropdownMenuItem(
                            value: op,
                            child: Text(op),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
