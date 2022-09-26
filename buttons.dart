import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyButtons(),
    );
  }
}

class MyButtons extends StatelessWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Buttons'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print('text button');
                },
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'Text button',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Elevated button');
                },
                child: Text('Elevated button'),
                //Elevated button은 백그라운드 컬러 없음 -> primary로
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                        //둥글게
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 0.0),
              ),
              OutlinedButton(
                  onPressed: () {
                    print('Outlined button');
                  },
                  child: Text('Outlined button'),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.green,
                      side: BorderSide(color: Colors.black87))),
              TextButton.icon(
                onPressed: () {
                  print('Icon button');
                },
                icon: Icon(Icons.home, size: 30.0, color: Colors.black87),
                label: Text('Go to home'),
                style: TextButton.styleFrom(primary: Colors.purple),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print('Icon button');
                },
                icon: Icon(Icons.home, size: 20.0, color: Colors.white),
                label: Text('Go to home'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(200, 50)),
              ),
              OutlinedButton.icon(
                onPressed: null, //비활성화
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                label: Text('Go to home'),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    onSurface: Colors.pink), //비활성화된 버튼 색 조정
              ),
              //한번에 버튼들을 끝정렬하는 게 버튼 바
              ButtonBar(
                alignment: MainAxisAlignment.center, //중앙이동
                buttonPadding: EdgeInsets.all(20),
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('TextButton'),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text('ElevatedButton'))
                ],
              )
            ],
          ),
        ));
  }
}
