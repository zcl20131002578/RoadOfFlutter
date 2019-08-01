import 'package:flutter/material.dart';
import 'NewRoute.dart';
import 'Utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "NewRoute": (context) => NewRoute(),
        "EchoRouter": (context) => EchoRouter(),
      },
      home: MyFanTamPageView(title: 'FanTeamPageView'),
    );
  }
}

class MyFanTamPageView extends StatefulWidget {
  MyFanTamPageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyFanTeamPageState createState() {
    return new MyFanTeamPageState();
  }
}

class MyFanTeamPageState extends State<MyFanTamPageView> {
  MyFanTeamPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FanTeamCustomView"),
        leading: Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 60,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.only(left: 14.0, right: 11.0),
                    padding: EdgeInsets.only(left: 12.0, top: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: MyTextStyle("我的真爱团等级",
                                  color: 0xFF333333, fontSize: 14),
                            ),
                            MyTextStyle("LV.5",
                                color: 0xFFFF0190, fontSize: 14),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                                child: MyTextStyle("")),
                            MyTextStyle("4546", color: 0xFF350022),
                            MyTextStyle("/", color: 0xFF350022),
                            MyTextStyle("5000", color: 0xFF350022),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            MyTextStyle("还差454陪伴值升级"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 50.0)),
                            MyTextStyle("今日+23陪伴值"),
                            Expanded(child: MyTextStyle("", color: 0x00000000)),
                            MyTextStyle("了解真爱团", color: 0xFF999999),
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  "images/fund_arrow_right.png",
                                  height: 20,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 12.0, top: 15.0),
                    margin: EdgeInsets.only(right: 14.0),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                          )
                        ]),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        MyTextStyle("基金礼包", fontSize: 14),
                        MyTextStyle("再赠送9999钻礼物 礼包+1", color: 0xFF999999),
                        Image.asset(
                          "images/fund_gift.png",
                          width: 60,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xFFFF63A0),
                                width: 1.5,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 7, right: 7, top: 4, bottom: 4),
                            child: MyTextStyle("15:00"),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15.0, left: 14),
              child: MyTextStyle("每日陪伴任务", fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  int _counter = 0;
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      print("print");
      debugPrint("debugPrint");
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          print("index=>0");
          break;
        case 1:
          print("index=>1");
          break;
        case 2:
          print("index=>2");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                print("leading onPressed");
              });
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // share method
              })
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.hdr_off),
            title: Text("firstTab"),
            activeIcon: Icon(Icons.hdr_on),
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_on),
            title: Text("SecondTab"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_on),
            title: Text("ThirdTab"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            title: Text("FourthTab"),
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.white,
        onTap: _onItemTaped,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.network(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                        width: 60,
                      ),
                    ),
                  ),
                  Text(
                    "Sidebar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
