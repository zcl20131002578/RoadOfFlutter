import 'package:flutter/material.dart';
import 'Utils.dart';

class MyFanTamPageViewRouter extends StatefulWidget {
  MyFanTamPageViewRouter({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyFanTeamPageState createState() {
    return new MyFanTeamPageState();
  }
}

class MyFanTeamPageState extends State<MyFanTamPageViewRouter> {
  MyFanTeamPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
