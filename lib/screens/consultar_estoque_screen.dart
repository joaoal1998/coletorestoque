import 'package:flutter/material.dart';
import '../utils/modal.dart';
import 'package:pocketbase/pocketbase.dart';

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  State<ConsultarEstoqueScreen> createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
  List<RecordModel> resultados = [];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          onSearchComplete: (resultList) {
            setState(() {
              resultados = resultList.items; // Armazena os resultados
            });
          },
        );
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
      body: resultados.isEmpty ? _buildEmptyState() : _buildResultTable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.search),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nenhuma Transação Cadastrada!'),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Image.asset('assets/estoque.png', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultTable() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              _buildHeaderRow(),
              ...resultados.map(_buildDataRow),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.red),
      children: [
        _buildTableCell('Código de barras'),
        _buildTableCell('Descrição'),
        _buildTableCell('Embalagem'),
      ],
    );
  }

  TableRow _buildDataRow(RecordModel record) {
    return TableRow(
      children: [
        _buildTableCell(record.getStringValue('codauxiliar')),
        _buildTableCell(record.getStringValue('descricao')),
        _buildTableCell(record.getStringValue('embalagem')),
      ],
    );
  }

  static TableCell _buildTableCell(String text) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
