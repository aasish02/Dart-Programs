import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyForm(),
    title: 'Form Validation',
  ));
}

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final List<Map<String, String>> submittedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  } else if (value.length < 3) {
                    return "Name should have more than 3 characters";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email Id'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Provide email id";
                  } else if (!value.contains('@')) {
                    return "Enter a valid email id";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      submittedData.add({
                        'name': name.text,
                        'email': email.text
                      });
                    });
                  }
                },
                child: Text("Submit"),
              ),
              // Display submitted data after submission
              if (submittedData.isNotEmpty)
                for (var data in submittedData)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Submitted Name: ${data['name']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Submitted Email: ${data['email']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
