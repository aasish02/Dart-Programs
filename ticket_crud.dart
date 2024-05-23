  import 'package:flutter/material.dart';

  void main() {
    runApp(TicketBookingApp());
  }

  class TicketBookingApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Ticket Booking System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TicketListPage(),
      );
    }
  }

  class Ticket {
    String name;
    String description;

    Ticket(this.name, this.description);
  }

  class TicketListPage extends StatefulWidget {
    @override
    _TicketListPageState createState() => _TicketListPageState();
  }

  class _TicketListPageState extends State<TicketListPage> {
    List<Ticket> tickets = [];

    void _addTicket() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TicketFormPage(
          onSave: (name, description) {
            setState(() {
              tickets.add(Ticket(name, description));
            });
          },
        )),
      );
    }

    void _editTicket(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TicketFormPage(
          ticket: tickets[index],
          onSave: (name, description) {
            setState(() {
              tickets[index].name = name;
              tickets[index].description = description;
            });
          },
        )),
      );
    }

    void _deleteTicket(int index) {
      setState(() {
        tickets.removeAt(index);
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Tickets'),
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
                    icon: Icon(Icons.edit),
                    onPressed: () => _editTicket(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTicket(index),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTicket,
          child: Icon(Icons.add),
        ),
      );
    }
  }

  class TicketFormPage extends StatefulWidget {
    final Ticket? ticket;
    final void Function(String, String) onSave;

    TicketFormPage({this.ticket, required this.onSave});

    @override
    _TicketFormPageState createState() => _TicketFormPageState();
  }

  class _TicketFormPageState extends State<TicketFormPage> {
    final _formKey = GlobalKey<FormState>();
    late TextEditingController _nameController;
    late TextEditingController _descriptionController;

    @override
    void initState() {
      super.initState();
      _nameController = TextEditingController(text: widget.ticket?.name ?? '');
      _descriptionController = TextEditingController(text: widget.ticket?.description ?? '');
    }

    @override
    void dispose() {
      _nameController.dispose();
      _descriptionController.dispose();
      super.dispose();
    }

    void _saveForm() {
      if (_formKey.currentState!.validate()) {
        widget.onSave(_nameController.text, _descriptionController.text);
        Navigator.of(context).pop();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.ticket == null ? 'Add Ticket' : 'Edit Ticket'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveForm,
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
