import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class TabelaConsulta extends StatefulWidget {
  final List<RecordModel> lista;
  const TabelaConsulta({super.key, required this.lista});

  @override
  State<TabelaConsulta> createState() => _TabelaConsultaState();

  static TableCell _buildTableCell(String text, Color colorText) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: TextStyle(color: colorText)),
      ),
    );
  }
}

class _TabelaConsultaState extends State<TabelaConsulta> {
  late List<RecordModel> resultados = widget.lista;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined,size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text('Estoque'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
        ),
        backgroundColor: Colors.yellow[50],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.red),
      children: [
        TabelaConsulta._buildTableCell('Código de barras', Colors.white),
        TabelaConsulta._buildTableCell('Descrição', Colors.white),
        TabelaConsulta._buildTableCell('Embalagem', Colors.white),
      ],
    );
  }

  TableRow _buildDataRow(RecordModel record) {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: [
        TabelaConsulta._buildTableCell(
            record.getStringValue('codauxiliar'), Colors.black),
        TabelaConsulta._buildTableCell(
            record.getStringValue('descricao'), Colors.black),
        TabelaConsulta._buildTableCell(
            record.getStringValue('embalagem'), Colors.black),
      ],
    );
  }
}
