import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer',
      home: ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {

  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                backgroundColor = Colors.red;
              });
            }, child: Text('Red')),

            ElevatedButton(onPressed: (){
              setState(() {
                backgroundColor = Colors.yellow;
              });
            }, child: Text('yellow')),

            ElevatedButton(onPressed: (){
              setState(() {
                backgroundColor = Colors.orange;
              });
            }, child: Text('orange')),
          ],

        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
