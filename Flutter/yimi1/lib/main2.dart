import 'package:flutter/material.dart';

void main() {
  runApp(LoginRoute());
}

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset('asset/myIcon1.png'), onPressed: () {}),
          title: Text('请响铃'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(
                  'https://uploadfile.bizhizu.cn/up/66/09/1c/66091ca523d1346619e5166f1bf4f1a4.jpg'),
            ),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Ring the bell of the heart",
                style: TextStyle(
                    fontSize: 24.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    decorationStyle: TextDecorationStyle.dashed),
                textAlign: TextAlign.center,
              ),
              ClipOval(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(
                      'https://avatars3.githubusercontent.com/u/19513504?s=460&v=4'),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4.0),
                          prefixIcon: Icon(Icons.account_box)),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          labelText: "密码",
                          hintText: "学号后八位",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              FlatButton(
                splashColor: Colors.grey,
                color: Colors.blue[200],
                highlightColor: Colors.pink[200],
                child: Text(
                  '登录',
                  style: TextStyle(fontSize: 14),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //click callback
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
