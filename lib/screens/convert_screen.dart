import 'package:conversor2/model/currencies.dart';
import 'package:flutter/material.dart';

class ConvertScreen extends StatefulWidget {
  final Ars moeda;

  const ConvertScreen({this.moeda});
  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  TextEditingController _realController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();
  double moeda;
  void _clearAll() {
    _realController.text = "";
    _moedaController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    _moedaController.text = (real / moeda).toStringAsFixed(4);
  }

  void _moedaChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double moeda = double.parse(text);
    _realController.text = (moeda * this.moeda).toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    moeda = widget.moeda.buy;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 150,
                child: buildTextField(
                    "Reais", "R\$", _realController, _realChanged)),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.text_snippet,
              color: Colors.black,
              size: 32,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 150,
              child: buildTextField("${widget.moeda.name}", null,
                  _moedaController, _moedaChanged),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
    String label, String prefix, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        enabledBorder: UnderlineInputBorder(),
        border: UnderlineInputBorder(),
        prefixText: prefix ?? ''),
    style: TextStyle(color: Colors.black, fontSize: 25.0),
    onChanged: f,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
