import 'package:flutter/material.dart';
import 'package:untitled/ScreenA.dart';
import 'package:untitled/ScreenB.dart';
import 'package:untitled/ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //첫번째로 보여질 라우트는 '/'로 설정
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenA(),
        '/b': (context) => ScreenB(),
        '/c': (context) => ScreenC(),
      },
    );
  }
}
