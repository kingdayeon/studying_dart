import 'package:flutter/material.dart';
import './style.dart';

void main() {
  runApp(MaterialApp(theme: theme, home: MyApp()));
}

//var도 사용 안 함

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0; //state에 tab의 현재상태 저장 '홈' 이렇게 한글로 저장해도 상관x

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {},
            iconSize: 30,
          )
        ],
      ),
      body: [Text('홈페이지'), Text('샵페이지')][tab], //주목
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false, //이렇게 해주면 밑에 안뜸
        showSelectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: '샵',
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag))
        ],
      ),
    );
  }
}
