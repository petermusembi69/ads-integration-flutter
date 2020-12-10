import 'package:flutter/material.dart';

class AdmobPage extends StatefulWidget {
  AdmobPage({Key key}) : super(key: key);

  @override
  _AdmobPageState createState() => _AdmobPageState();
}

int _currentIndex = 0;
List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.g_translate),
    label: 'Admob',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.face),
    label: 'Facebook',
    backgroundColor: Colors.grey,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.games),
    label: 'Unity',
    backgroundColor: Colors.grey,
  ),
];

class _AdmobPageState extends State<AdmobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: Text('Admob'),
        centerTitle: true,
      ),
      body: Column(children: []),
    );
  }
}
