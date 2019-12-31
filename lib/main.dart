import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(home: new MyDecimalValidatorApp()));
}

class MyDecimalValidatorApp extends StatefulWidget {
  @override
  _MyDecimalValidatorAppState createState() => _MyDecimalValidatorAppState();
}

class _MyDecimalValidatorAppState extends State<MyDecimalValidatorApp> {
  RegExp regExp = new RegExp(
    "[+-]?([0-9]*[.])?[0-9]+",
  );
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decimal Number Validator"),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [DecimalInputFormatter()],
                      controller: _controller,
                      onChanged: (value) {}),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      textColor: Colors.white,
                      color: Colors.blue[400],
                      child: new Text("Clear TextFormField"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx = RegExp(r"^\d*\.?\d*");
    String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}
