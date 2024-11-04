import 'package:coletorestoque/screens/tabela.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConsultarEstoqueScreen extends StatefulWidget {
  const ConsultarEstoqueScreen({super.key});

  @override
  State<ConsultarEstoqueScreen> createState() => _ConsultarEstoqueScreenState();
}

class _ConsultarEstoqueScreenState extends State<ConsultarEstoqueScreen> {
  String _resultado = '';
  late TextEditingController codigoDeBarras = TextEditingController();
  final descricao = ValueNotifier('');
  final secao = ValueNotifier('');
  final marca = ValueNotifier('');

  Future<void> buscarProduto() async {
    const url = 'http://192.168.2.58:8000/consulta/produtos/?codigo=4';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _resultado = data.toString();
        });
      } else {
        setState(() {
          _resultado = 'Erro: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _resultado = 'Erro: $e';
      });
    }
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
      body: _buildEmptyState(),
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
            const Text(
              "Informe os filtros",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: TextField(
                onSubmitted: (value) async {
                  await buscarProduto();
                  /*setState(() {});
                  resultados.isEmpty
                      ? null
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabelaConsulta(
                                    lista: resultados,
                                  )));*/
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
              valueListenable: descricao,
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
                    hint: const Text('Descrição'),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) {
                      descricao.value = escolha.toString();
                    },
                    items: ['produto A', 'produto B', 'produto C', 'Decoração']
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
                      await buscarProduto();
                      print(_resultado);
                     /* FocusScope.of(context).unfocus();
                      setState(() {});
                      resultados.isEmpty
                          ? null
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabelaConsulta(
                                        lista: resultados,
                                      )));*/
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
