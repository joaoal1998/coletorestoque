import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const InventarioScreen());
}

class InventarioScreen extends StatelessWidget {
  const InventarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inventario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  late TextEditingController codigoDeBarras = TextEditingController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Card(
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
                            const Text(
                              'Decrição do produto - Embalagem',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Código de barras: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Text(
                              'Inventário: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Text(
                              'Departamento: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Text(
                              'Seção: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Text(
                              'Categoria: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Text(
                              'Subcategoria: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            const Text(
                              'Quantidade atual: ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Qt. contagem: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    onSubmitted: (value) {},
                                    cursorColor: Colors.red,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
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
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ],
                    ),
                  ],
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                  paginaInicial: 2,
                                )),
                      );
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Produto atualizado'),
                        ),
                      );
                    },
                    child: const Text('Atualizar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
