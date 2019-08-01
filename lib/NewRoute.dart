import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Route")),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: " 您的登录密码",
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 13.0,
                  ),
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            Container(
              margin: EdgeInsets.only(left: 100),
              padding: EdgeInsets.all(10.0),
              width: 200.0,
              height: 150.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ]),
              alignment: Alignment.center,
              child: Text(
                "520",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              color: Colors.orange,
              child: Text("margin"),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Text("padding"),
            )
          ],
        ),
      ),
    );
  }
}

class EchoRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //暂时还没有，需要升级
    //var args = ModalRoute.of(context).settings.arguments
    String icons = "";
    icons += "\uE914";
    icons += " \uE000";
    icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(title: Text("EchoRouter")),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("first text", style: Theme.of(context).textTheme.display2),
            Text(
              "second text",
              style: TextStyle(fontSize: 20, color: Colors.blue),
              maxLines: 1,
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            IconButton(icon: Icon(Icons.thumb_up), onPressed: () => {}),
//            IconButton(icon: ImageIcon(), onPressed: () => {}),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
              height: 200.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              repeat: ImageRepeat.repeatY,
            ),
            FlatButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () => {},
//              EdgeInsetsGeometry
              padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text("custom Button"),
            )
          ],
        ),
      ),
    );
  }
}

class EchoTextStateless extends StatelessWidget {
  const EchoTextStateless({Key key, @required this.text, this.background})
      : super(key: key);

  final String text;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: this.background,
        child: Text(this.text),
      ),
    );
  }
}

class EchoTextStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return null;
  }
}
