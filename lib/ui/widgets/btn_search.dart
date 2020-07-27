import 'package:flutter/material.dart';

//搜索栏 动态广告处理
class SearchBtnWidget extends StatefulWidget {
  @override
  _SearchBtnState createState() => _SearchBtnState();
}

class _SearchBtnState extends State<SearchBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints.tightFor(height: 40),
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 20,
//                Text('Container设置最小宽高')
              child: TextField(
                enabled: false,
                decoration: new InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                    border: InputBorder.none,
                    hintText: "This is a hint"),
              ),
            ),
          ],
        ));
  }
}
