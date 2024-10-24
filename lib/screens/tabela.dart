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
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        "${tr.getStringValue('descricao')} ${tr.getStringValue('embalagem')}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Código do produto: ${tr.getStringValue('codprod')}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Código de barras: ${tr.getStringValue('codauxiliar')}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Marca: ${tr.getStringValue('marca')}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Fornecedor: ${tr.getStringValue('codfornec')}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Departamento: ${tr.getStringValue('codepto')}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Seção: ${tr.getStringValue('codsec')}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        "Quantidade estoque: ${tr.getStringValue('descricao')}",
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
