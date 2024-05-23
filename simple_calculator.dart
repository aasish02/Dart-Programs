import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _firstNumberController = TextEditingController();
  TextEditingController _secondNumberController = TextEditingController();
  double _result = 0.0;

  void _calculateResult(Operation operation) {
    double firstNumber = double.tryParse(_firstNumberController.text) ?? 0.0;
    double secondNumber = double.tryParse(_secondNumberController.text) ?? 0.0;
    setState(() {
      switch (operation) {
        case Operation.Add:
          _result = firstNumber + secondNumber;
          break;
        case Operation.Subtract:
          _result = firstNumber - secondNumber;
          break;
        case Operation.Multiply:
          _result = firstNumber * secondNumber;
          break;
        case Operation.Divide:
          if (secondNumber != 0) {
            _result = firstNumber / secondNumber;
          } else {
            _result = double.nan; // Handle division by zero
          }
          break;
        case Operation.Modulo:
          _result = firstNumber % secondNumber;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator')), // Center the title
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _firstNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter 1st number'),
              ),
              TextField(
                controller: _secondNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter 2nd number'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Result: ${_result}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _calculateResult(Operation.Add),
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateResult(Operation.Subtract),
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateResult(Operation.Multiply),
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateResult(Operation.Divide),
                    child: Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculateResult(Operation.Modulo),
                    child: Text('%'),
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

enum Operation {
  Add,
  Subtract,
  Multiply,
  Divide,
  Modulo,
}
