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
            appBar: AppBar(),
            body: Container(
              //박스 2개 가로로 배치
              child: Row(
                children: [
                  Image.asset(
                    'canon.jpg',
                    width: 150,
                  ),
                  Expanded(
                    child: Container(
                      height: 150, //이걸 해줘야 나란히 배치됨 ㄷㄷ
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('카메라팝니다'),
                          Text('금호동 3가'),
                          Text('7000원'),
                          //가로로 아이콘이랑 글자 배치하고 싶으니까 Row 써주면 됨!
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite),
                              Text('4'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
