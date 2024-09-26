import 'package:flutter/material.dart';
import 'colors.dart';

class TextFieldScreen extends StatefulWidget {
  final String textoTip;

  const TextFieldScreen({super.key, required this.textoTip});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  late TextEditingController campoTexto = TextEditingController();
  late String textoDica = widget.textoTip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      child: TextField(
        controller: campoTexto,
        cursorColor: Constants.details,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            labelText: textoDica,
            floatingLabelStyle: TextStyle(
              color: Constants.details,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.details, width: 2),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
