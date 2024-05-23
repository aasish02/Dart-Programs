import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(MaterialApp(
    title: "Validation",
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/crud': (context) => Crud(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/crud');
          },
          child: Text('Crud'),
        ),
      ),
    );
  }
}

class Ticket {
  String name = '';
  String description = '';

  Ticket({required this.name, required this.description});
}

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  List<Ticket> tickets = [];

  void addorEditTicket({int? index}) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    if (index != null) {
      nameController.text = tickets[index].name;
      descriptionController.text = tickets[index].description;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Adding ticket' : 'Editing ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // It can be new or edit one.
                setState(() {
                  if (index == null) {
                    tickets.add(Ticket(
                        name: nameController.text,
                        description: descriptionController.text));
                  } else {
                    tickets[index].name = nameController.text;
                    tickets[index].description = descriptionController.text;
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void deleteTicket(int index) {
    setState(() {
      tickets.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Operations'),
      ),
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tickets[index].name),
            subtitle: Text(tickets[index].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    addorEditTicket(index: index);
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deleteTicket(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addorEditTicket();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
