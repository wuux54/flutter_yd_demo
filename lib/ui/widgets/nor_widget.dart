import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_world/constant/data.dart';

Widget labelWidget() {
  return Container(
    margin: EdgeInsets.only(left: 3),
    padding: EdgeInsets.only(
      left: 3,
      right: 3,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8)),
      gradient: LinearGradient(colors: [
        Color(ColorConstant.brownDCCABB),
        Color(ColorConstant.brownB69A85)
      ]),
    ),
    child: Text(
      "推荐",
      style: TextStyle(fontSize: 10, color: Colors.white),
    ),
  );
}

Widget bottomWidget(
    int colorLeft, int colorRight, String leftString, String rightString) {
  return Row(
    children: <Widget>[
      Offstage(
        offstage: leftString == null,
        child: Container(
          margin: EdgeInsets.only(right: 5, top: 5),
          padding: EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
          color: Color(colorLeft),
          child: Text(
            leftString == null ? "" : leftString,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
      Offstage(
        offstage: rightString == null,
        child: Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
          color: Color(colorRight),
          child: Text(
            rightString == null ? "" : rightString,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      )
    ],
  );
}

Widget btnWidget(String text) {
  return Container(
    width: 80,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0x88FF7B26),
          offset: Offset(2, 4),
          blurRadius: 5,
        )
      ],
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(colors: <Color>[
        Color(ColorConstant.redFF584B),
        Color(ColorConstant.redFF7B26)
      ]),
    ),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );
}
