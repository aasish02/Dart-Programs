import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text1 = '';
  String text2 = '';

  void t1() {
    setState(() {
      text1 = 'Loading the container 1';
    });
  }

  void t2() {
    setState(() {
      text2 = 'Loading the container 2';
    });
  }

  void t3() {
    setState(() {
      text1 = '';
      text2 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      color: Colors.cyan,
                      child: Center(child: Text(text1))),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      color: Colors.cyan,
                      child: Center(child: Text(text2))),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      color: Colors.cyan,
                      child: MaterialButton(
                        child: Text('Click me!'),
                        onPressed: t1,
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      color: Colors.cyan,
                      child: MaterialButton(
                        child: Text('Click me!'),
                        onPressed: t2,
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      color: Colors.cyan,
                      child: MaterialButton(
                        child: Text('Click me!'),
                        onPressed: t3,
                      )),
                ),
              ),
            ],
          )
        ]));
  }
}