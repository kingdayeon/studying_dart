import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('앱임'),
      ),
      body: Container(
        child: Text('안녕'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: '폰'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '메시지'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: '컨텍트'),
        ],
      ),
    ));
  }
}
