import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3; //친구수
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  addName() {
    setState(() {
      name.add('말숙');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(
                Icons.person,
                size: 35,
              ),
              title: Text(name[i]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Text('Dialog'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(
                  addName: addName,
                );
              });
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addName}) : super(key: key);
  final addName;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        //Dialog안에 child로 넣어줌 ㅠㅠ
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: inputData,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('완료'),
                  onPressed: () {
                    addName();
                  },
                ),
                TextButton(
                  child: Text('취소'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
