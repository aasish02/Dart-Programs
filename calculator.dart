import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        _num1 = 0.0;
        _num2 = 0.0;
        _operand = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operand == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == '*') {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == '/') {
          _output = (_num1 / _num2).toString();
        }
        _num1 = 0.0;
        _num2 = 0.0;
        _operand = '';
      } else {
        _output += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]!),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(24.0)),
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('C'),
                    buildButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}