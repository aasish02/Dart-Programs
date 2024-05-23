import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Name: your  name ";
  String batch = "Batch: 2025";
  String institute = "Institute: SSN College of Engineering";
  Color textColor = Colors.black;
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              batch,
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              institute,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  textColor = Colors.blue;
                });
              },
              child: Text('Change Text Color'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.red[300] ?? Colors.red;
                });
              },
              child: Text('Change Background Color'),
            ),
          ],
        ),
      ),
    );
  }
}