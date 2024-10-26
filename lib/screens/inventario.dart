import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  runApp(const InventarioScreen());
}

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  List<RecordModel> resultados = [];
  String? id;
  final pb = PocketBase('http://192.168.169.3:8091');
  late TextEditingController codigoDeBarras = TextEditingController();
  late TextEditingController quantidade = TextEditingController();

  Future<List<RecordModel>> busca() async {
    final resultList = await pb.collection('kntinventario').getList(
        filter: 'codauxiliar = "${codigoDeBarras.text}"',
        fields: "id,QT1, codauxiliar, descricao, embalagem");

    resultados.clear();
    final record = resultList.items.first;
    resultados.add(record);
    id = resultados.isNotEmpty ? resultados[0].id : null;
    return resultados;
  }

  Future<void> atualiza() async {
    final body = <String, dynamic>{
      "QT1": quantidade.text,
    };
    await pb.collection('kntinventario').update('$id', body: body);
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
          title: const Text('Inventário'),
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
                                        child: Text(
                                          "Código do produto: ${tr.getStringValue('codprod')}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          "Inventário: ${tr.getStringValue('numinventario')}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
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
                                        child: Text(
                                          "Marca: ${tr.getStringValue('marca')}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          "Fornecedor: ${tr.getStringValue('codfornec')}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
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
                                        child: Text(
                                          "Departamento: ${tr.getStringValue('codepto')}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          "Seção: ${tr.getStringValue('codsec')}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(
                                        "Quantidade estoque: ${tr.getStringValue('qtestger')}",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Qt. contagem: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: TextField(
                                          controller: quantidade,
                                          onSubmitted: (value) {},
                                          cursorColor: Colors.red,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
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
                    resultados.isEmpty
                        ? ElevatedButton(
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
                              setState(() {});
                            },
                            child: const Text('Pesquisar'),
                          )
                        : ElevatedButton(
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
                              await atualiza();
                            },
                            child: const Text('Atualizar'),
                          ),
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
