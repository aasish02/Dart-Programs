import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fragment Demo',
      home: FragmentDemo(),
    );
  }
}

class FragmentDemo extends StatefulWidget {
  @override
  _FragmentDemoState createState() => _FragmentDemoState();
}

class _FragmentDemoState extends State<FragmentDemo> {
  int _selectedIndex = 0;

  static const List<Widget> _fragments = <Widget>[
    Fragment(title: 'Fragment 1'),
    Fragment(title: 'Fragment 2'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fragment Demo'),
      ),
      body: _fragments.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Fragment 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Fragment 2',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Fragment extends StatelessWidget {
  final String title;

  const Fragment({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
