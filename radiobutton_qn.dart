import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: RadioButtons(),
  ));
}

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}
enum Gender{
  male,female,
}

class _RadioButtonsState extends State<RadioButtons> {

  final nameController = TextEditingController();
  final addrController = TextEditingController();
  final ageController = TextEditingController();
  Gender selectedgender = Gender.male;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: addrController,
              decoration: InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Radio(value: Gender.male, groupValue: selectedgender, onChanged: (Gender? value){
                  setState(() {
                    selectedgender = value ?? Gender.male;
                  });
                }),Text('Male'),
                Radio(value: Gender.female, groupValue: selectedgender, onChanged: (Gender ? value){
                  setState(() {
                    selectedgender = value??Gender.female;
                  });
                }),Text('Female'),
              ],
            ),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Your details"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Name :${nameController.text}'),
                          Text('Address :${addrController.text}'),
                          Text('Age :${ageController.text}'),
                          Text('Gender :${selectedgender}'),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('OK'))
                      ],
                    );
                  });
            }, child: Text('Submit'))

          ],
        ),
      ),
    );
  }
}
