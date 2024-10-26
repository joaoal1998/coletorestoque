import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  runApp(const ConsultaInventarioScreen());
}

class ConsultaInventarioScreen extends StatefulWidget {
  const ConsultaInventarioScreen({super.key});

  @override
  State<ConsultaInventarioScreen> createState() =>
      _ConsultaInventarioScreenState();
}

class _ConsultaInventarioScreenState extends State<ConsultaInventarioScreen> {
  List<RecordModel> resultados = [];
  String? id;
  final pb = PocketBase('http://192.168.169.3:8091');
  late TextEditingController codigoDeBarras = TextEditingController();

  Future<List<RecordModel>> busca() async {
    try {
      final resultList = await pb.collection('kntinventario').getList(
            filter: 'numinvent = "${codigoDeBarras.text}"',
            fields:
                "id,numinvent,QT1,codprod,codauxiliar,descricao,fornecedor,embalagem,marca,departamento,secao,qtestger",
          );

      resultados.clear();

      if (resultList.items.isNotEmpty) {
        for (var item in resultList.items) {
          resultados.add(item);
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Inventário não encontrado'),
              content: const Text(
                  'Nenhum inventário foi encontrado com esse código.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

      return resultados;
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text('Ocorreu um erro ao buscar o inventário.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return [];
    }
  }

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
          title: const Text('Consultar inventário'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.yellow[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onSubmitted: (value) async {
                    await busca();
                    setState(() {});
                  },
                  controller: codigoDeBarras,
                  cursorColor: Colors.red,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      labelText: 'Número do inventário',
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
                const SizedBox(height: 20),
                Flexible(
                  flex: 10,
                  child: resultados.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: const Text('Não há dados a serem exibidos'))
                      : ListView.builder(
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(
                                        "${tr.getStringValue('descricao')} - ${tr.getStringValue('embalagem')}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Cod. produto: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text: tr
                                                    .getStringValue('codprod'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                          child: RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "Inventário: ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: tr
                                                  .getStringValue('numinvent'),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Marca: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    tr.getStringValue('marca'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Fornecedor: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text: tr.getStringValue(
                                                    'fornecedor'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Departamento: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text: tr.getStringValue(
                                                    'departamento'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Seção: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    tr.getStringValue('secao'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Qt. estoque: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text: tr
                                                    .getStringValue('qtestger'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Qt inventário: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text: tr.getStringValue('QT1'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Voltar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () async {
                        await busca();
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      },
                      child: const Text('Pesquisar'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
