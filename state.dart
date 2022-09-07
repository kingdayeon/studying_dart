import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //class는 변수 보관 통이기 때문에 여기에 변수 만들어도 상관없음
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0]; //힌트

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('연락처앱'),
            ),
            body: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i) {
                  print(i);
                  return ListTile(
                    leading: Text(like[i].toString()),
                    title: Text(name[i]),
                    trailing: ElevatedButton(
                      child: Text('좋아요'),
                      onPressed: () {
                        setState(() {
                          like[i]++;
                        });
                      },
                    ),
                  );
                }),
            bottomNavigationBar: Bottom()));
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page)
          ],
        ),
      ),
    );
  }
}
