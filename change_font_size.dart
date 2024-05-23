import 'dart:math';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: FontChange(),
    title: "Fontchange",
  ));
}

class FontChange extends StatefulWidget {
  const FontChange({super.key});

  @override
  State<FontChange> createState() => _FontChangeState();
}

class _FontChangeState extends State<FontChange> {
  Color color1 = Colors.black;
  double fontsize = 40.0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font changing"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Helloo",
            style: TextStyle(color: color1, fontSize: fontsize),
            ),

            SizedBox(width: 20),

            ElevatedButton(onPressed: (){
              setState(() {
                color1 = Color.fromARGB(
                  255,
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                );

                fontsize = fontsize+2.0;
              });
            }, child: Text("Press me"))
          ],
        ),
      ),
    );
  }
}
