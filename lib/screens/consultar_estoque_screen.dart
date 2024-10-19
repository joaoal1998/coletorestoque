import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  State<ConsultarEstoqueScreen> createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
  List<RecordModel> resultados = [];
  late TextEditingController codigoDeBarras = TextEditingController();
  final departamento = ValueNotifier('');
  final secao = ValueNotifier('');
  final marca = ValueNotifier('');

  final pb = PocketBase('http://192.168.169.3:8091');

  Future<List<RecordModel>> busca() async {
    final resultList = await pb.collection('embalagens').getList(
          filter:
              'descricao = "${departamento.value}" || codauxiliar = "${codigoDeBarras.text}" || codsec = "${secao.value}" || codmarca = "${marca.value}"',
          fields: 'descricao,codauxiliar,embalagem',
        );

    resultados.clear();

    for (var item in resultList.items) {
      resultados.add(item);
    }

    return resultados;
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
      backgroundColor: Colors.yellow[50],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(15)),
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
                onSubmitted: (value) async {
                  await busca();
                  setState(() {});
                },
                controller: codigoDeBarras,
                cursorColor: Colors.red,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    labelText: 'Código de barras',
                    floatingLabelStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(height: 25),
            ValueListenableBuilder(
              valueListenable: departamento,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text('Departamento'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      departamento.value = escolha.toString();
                    },
                    items: ['maizena', 'Confeitaria', 'Festas', 'Decoração']
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
              valueListenable: secao,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text('Seção'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      secao.value = escolha.toString();
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
              valueListenable: marca,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                    isExpanded: true,
                    hint: const Text('Marca'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      marca.value = escolha.toString();
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
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      await busca();
                      setState(() {});
                    },
                    child: const Text('Pesquisar'))
              ],
            )
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
