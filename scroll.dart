import 'package:flutter/material.dart';
import './style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart'; //스크롤 관련 유용한 함수들

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
  var data = [];

  addData(a) {
    setState(() {
      data.add(a);
    });
  }

  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));

    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2;
    });
  }

  void initState() {
    super.initState();
    getData();
  }

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
      body: [
        Home(
          data: data,
        ),
        Text('샵페이지')
      ][tab],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false, //이렇게 해주면 밑에 안뜸
        showSelectedLabels: false,
        currentIndex: tab,
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

class Home extends StatefulWidget {
  const Home({Key? key, this.data, this.addData}) : super(key: key);
  final data;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();
  getMore() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    widget.addData(result2);
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);

    if (widget.data.isNotEmpty) {
      return ListView.builder(
          itemCount: widget.data.length, //리스트의 길이만큼
          controller: scroll,
          itemBuilder: (c, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.data[i]['image']),
                Text('좋아요 ${widget.data[i]['likes']}'),
                Text(widget.data[i]['user']),
                Text(widget.data[i]['content']),
              ],
            );
          });
    } else {
      return Text('로딩중임');
    }
  }
}
