import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Center(
              child: Image(
                image: AssetImage('assets/chef.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
              child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15.0))),
                  child: Container(
                      padding: EdgeInsets.all(40.0), //로그인창 패딩
                      child: Column(
                        children: [
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Enter "dice"'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Enter "Password"'),
                            keyboardType: TextInputType.text,
                            obscureText: true, //비번 안뜨게
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent,
                                  ),
                                  onPressed: () {},
                                  child: Icon(Icons.arrow_forward,
                                      color: Colors.white, size: 35.0))),
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
