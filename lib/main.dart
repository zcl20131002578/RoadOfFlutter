import 'package:flutter/material.dart';
import 'FansTeamSimple.dart';
import 'InfiniteListViewSimple.dart';
import 'NewRoute.dart';

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
        "InfiniteListViewRouter": (context) => InfiniteListViewRouter(),
      },
      home: MyHomePageRouter(title: 'HomePage'),
    );
  }
}

class MyHomePageRouter extends StatefulWidget {
  MyHomePageRouter({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageRouterState createState() => _MyHomePageRouterState();
}

class _MyHomePageRouterState extends State<MyHomePageRouter>
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
      drawer: UserDrawer(),
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
        children: <Widget>[
          InfiniteListViewRouter(), //无线list的列表
          MyFanTamPageViewRouter(), //真爱团
          NewRoute(),               //随意写的
        ],
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

class UserDrawer extends StatelessWidget {
  const UserDrawer({
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
