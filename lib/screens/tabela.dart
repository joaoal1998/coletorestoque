import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class TabelaConsulta extends StatefulWidget {
  final List<RecordModel> lista;
  const TabelaConsulta({super.key, required this.lista});

  @override
  State<TabelaConsulta> createState() => _TabelaConsultaState();
}

class _TabelaConsultaState extends State<TabelaConsulta> {
  late List<RecordModel> resultados = widget.lista;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_outlined, size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text('Estoque'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: resultados.length,
          itemBuilder: (ctx, index) {
            final tr = resultados[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Text(
                            "${tr.getStringValue('descricao')} ${tr.getStringValue('embalagem')}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Código do produto: ${tr.getStringValue('codprod')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Código de barras: ${tr.getStringValue('codauxiliar')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Marca: ${tr.getStringValue('marca')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Fornecedor: ${tr.getStringValue('codfornec')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Departamento: ${tr.getStringValue('codepto')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Seção: ${tr.getStringValue('codsec')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Quantidade estoque: ${tr.getStringValue('descricao')}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        backgroundColor: Colors.yellow[50],
      ),
    );
  }
}
