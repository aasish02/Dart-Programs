import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: DetailsPage(),
    );
  }
}

class DetailsPage extends StatefulWidget{
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{

  TextEditingController namecontroller = TextEditingController();
  TextEditingController salarycontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController deptcontroller = TextEditingController();

  void Display() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Details Entered'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(namecontroller.text),
                  ),
                  ListTile(
                    title: Text('Age'),
                    subtitle: Text(agecontroller.text),
                  ),
                  ListTile(
                    title: Text('Salary'),
                    subtitle: Text(salarycontroller.text),
                  ),
                  ListTile(
                    title: Text('Department'),
                    subtitle: Text(deptcontroller.text),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Close')
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Employee Details'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20.0,top: 40),
          child: Column(
            children: [
              SizedBox(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                  controller: namecontroller,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Salary',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  controller: salarycontroller,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  controller: agecontroller,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Department',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  controller: deptcontroller,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Display();
                    },
                    child: Text('Submit')
                ),
              )
            ],
          ),
        ),
      );
    }
}