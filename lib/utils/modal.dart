import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/campo_textual.dart';
import '../utils/campo_menu.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Constants.background, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),
            const Text("Informe os filtros"),
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
                dropOpcoes: const ['marca 1', 'marca 2'], labelCampo: 'Marca'),
            const SizedBox(height: 125),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.black,
                            width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Constants.buttonBackground,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text('Pesquisar'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
