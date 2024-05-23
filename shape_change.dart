import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: ShapeChange(),
    title: "ShapeChange",
  ));
}

class ShapeChange extends StatefulWidget {
  const ShapeChange({super.key});

  @override
  State<ShapeChange> createState() => _ShapeChangeState();
}

class _ShapeChangeState extends State<ShapeChange> {
  String shape = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shape change"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(shape.isNotEmpty) _buildshape(),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () {
              setState(() {
                shape = 'rectangle';
              });
            }, child: Text("rectangle")),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              setState(() {
                shape = 'circle';
              });
            }, child: Text("circle")),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              setState(() {
                shape = "";
              });
            }, child: Text("clear")),

          ],
        ),
      ),
    );
  }

  Widget _buildshape() {
    if (shape == 'rectangle') {
      return Container(
        width: 100,
        height: 50,
        color: Colors.blue,
      );
    }
    else if (shape == 'circle') {
      return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      );
    }
    else {
      return Container();
    }
  }
}