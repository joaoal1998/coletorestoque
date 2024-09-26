import 'package:flutter/material.dart';
import 'colors.dart';

class DropDownScreen extends StatelessWidget {
  final List<String> dropOpcoes;
  final String labelCampo;
  final dropValue = ValueNotifier('');

  DropDownScreen(
      {super.key, required this.dropOpcoes, required this.labelCampo});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, String value, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(
                  color: Constants.details,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.details, width: 2),
                    borderRadius: BorderRadius.circular(10))),
            isExpanded: true,
            hint: Text(labelCampo),
            value: (value.isEmpty) ? null : value,
            onChanged: (escolha) => dropValue.value = escolha.toString(),
            items: dropOpcoes
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
    );
  }
}
