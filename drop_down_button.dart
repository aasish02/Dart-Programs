import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('State Selection'),
      ),
      body: StateSelection(),
    ),
  ));
}

class StateSelection extends StatefulWidget {
  @override
  _StateSelectionState createState() => _StateSelectionState();
}

class _StateSelectionState extends State<StateSelection> {
  late String selectedState;

  @override
  void initState() {
    super.initState();
    selectedState = 'Select State';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('State:'),
          DropdownButton<String>(
            value: selectedState,
            onChanged: (String? newValue) {
              setState(() {
                selectedState = newValue!;
              });
            },
            items: <String>[
              'Select State',
              'Alabama',
              'Alaska',
              'Arizona',
              'Arkansas',
              'California',
              // Add more states here as needed
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
