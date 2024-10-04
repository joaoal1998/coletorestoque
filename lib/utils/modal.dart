import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  late TextEditingController codigoDeBarras = TextEditingController();
  final dropValue = ValueNotifier('');

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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: TextField(
                controller: codigoDeBarras,
                cursorColor: Constants.details,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    labelText: 'Código de barras',
                    floatingLabelStyle: TextStyle(
                      color: Constants.details,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Constants.details, width: 2),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(height: 25),
            ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Constants.details,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Constants.details, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text('Departamento'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      dropValue.value = escolha.toString();
                    },
                    items: ['Bomboniere', 'Confeitaria', 'Festas', 'Decoração']
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
            ),
            const SizedBox(height: 25),
            ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Constants.details,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Constants.details, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text('Seção'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      dropValue.value = escolha.toString();
                    },
                    items: ['secao 1', 'secao 2', 'secao 3']
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
            ),
            const SizedBox(height: 25),
            ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Constants.details,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Constants.details, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text('Marca'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      dropValue.value = escolha.toString();
                    },
                    items: ['marca 1', 'marca 2', 'marca 3']
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
            ),
            const SizedBox(height: 125),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Constants.buttonBackground,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Pesquisar'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
