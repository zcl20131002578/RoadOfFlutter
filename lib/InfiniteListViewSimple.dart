import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteListViewRouter extends StatefulWidget {
  @override
  _InfiniteListViewRouterState createState() =>
      new _InfiniteListViewRouterState();
}

class _InfiniteListViewRouterState extends State<InfiniteListViewRouter> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag]; //ZCL 2019-08-08 Dart String[]初始化的构造,与Java有出入

  @override
  void initState() {
    super.initState();
    print("_InfiniteListViewRouterState_retrieveData");
    _retrieveData("initState");
  }

  void _retrieveData(String from) {
    print("_retrieveData from==" + from);
    Future.delayed(Duration(seconds: 2)).then((e) {
      //ZCL 2019-08-08 从FirstParam位置"插入"iterable中的所有对象(插入并不是删除)
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (BuildContext context, int index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData("build");
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: .0);
      },
    );
  }
}
