import 'package:flutter/material.dart';
import '../utils/modal.dart';

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  State<ConsultarEstoqueScreen> createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return const TransactionForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar Estoque', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Table(
              border: TableBorder.all(color: Colors.black),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                    decoration: BoxDecoration(color: Colors.red),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Titulo 1'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Titulo 2'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Titulo 3'),
                        ),
                      ),
                    ]),
                ...List.generate(
                  50,
                  (index) => const TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('TransactionData.codAuxiliar as String'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('TransactionData.descricao as String'),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('TransactionData.embalagem as String'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(TransactionData.embalagem),//_openTransactionFormModal(context),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.search),
      ),
    );
  }
}
