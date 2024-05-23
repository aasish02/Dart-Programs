// import 'dart:math';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home:BgColor(),
    title: 'pract1',
  ));
}

class BgColor extends StatefulWidget {
  const BgColor({super.key});

  @override
  State<BgColor> createState() => _BgColorState();
}

class _BgColorState extends State<BgColor> {
  Color bgcolor = Colors.yellow;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              bgcolor = Colors.blue;
            });
          },
          child: Text('Click me'),
        ),
      ),
      backgroundColor: Color.fromARGB(255,random.nextInt(256),random.nextInt(256),random.nextInt(256)),
    );
  }
}
