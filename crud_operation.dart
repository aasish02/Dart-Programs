import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    title: 'Crud',
    home: HomePage(),
  ));
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Ticket{
  String name;
  String description;

  Ticket({required this.name, required this.description});
}
class _HomePageState extends State<HomePage> {
  final List<Ticket> tickets = [];

  //checks whether index is provided or null.
  void _addOrEditTicket({int? index}) {
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
          title: Text(index == null ? 'Add Ticket' : 'Edit Ticket'),
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
            TextButton(onPressed:(){
              final nameFromTextField = nameController.text;
              final descriptionFromTextField = descriptionController.text;

              setState(() {
                if(index==null){//new ticket
                  tickets.add(Ticket(name:nameFromTextField, description:descriptionFromTextField));
                }
                else{//edit
                  tickets[index] = Ticket(name: nameFromTextField, description: descriptionFromTextField);
                }
              });
              Navigator.pop(context);//remember to give this.
            },
                child: Text('Save'))
          ], // Added the closing bracket for actions list
        ); // Added the closing parentheses for AlertDialog
      },
    );
  }

  void deleteTicket(int index)
  {
    setState(() {
      tickets.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),

      body: ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(tickets[index].name),
              subtitle: Text(tickets[index].description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: Icon(Icons.edit),
                  onPressed: (){
                        _addOrEditTicket(index: index);//imp send the index as parameter.
                  },),
                  
                  IconButton(onPressed: (){
                    deleteTicket(index);//imp send the index as parameter.
                  }, icon: Icon(Icons.delete))
                ],
              ),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          _addOrEditTicket();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
