import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    title: 'BMI',
    home: BmiCalculator(),
  ));
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  double bmi = 0.0;
  
  void calculateBmi(){
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    setState(() {
      bmi = weight/(height*height);
    //   bmi.toStringAsFixed(2); // Round off to two decimal places
    });

    if (bmi>30){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('High BMI alert'),
              content: Text('Do more exercise! Be fit!'),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                },
                    child: Text('Ok'))
              ],
            );
          });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your weight '),
            ),

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your height '),
            ),

            SizedBox(height: 16.0),

            Text(
              'BMI is ${bmi}',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16.0),

            ElevatedButton(onPressed: (){
              calculateBmi();
            }, child: Text('Calculate'))

          ],
        ),
      ),
    );
  }
}