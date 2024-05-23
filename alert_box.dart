import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AlertBox(),
    title: "Alert App",
  ));
}

class AlertBox extends StatefulWidget {
  const AlertBox({Key? key});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert App"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String userName = name.text;

                showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      title: Text('Alert'),
                      content: Text('Hi $userName, Done!'),
                    );
                  },
                );
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
