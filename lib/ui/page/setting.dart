import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/utils/utils_app.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingFulPageState createState() => _SettingFulPageState();
}

class _SettingFulPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstant.whiteF4F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context,"ddd");
          },
          child: Image.asset(
            ImgConstantData.IMG_ICON_ARROW_LEFT,
          ),
        ),
        brightness: Brightness.light,
        title: Text(
          "设置",
          style: TextStyle(
              color: Color(ColorConstant.black444444),
              fontWeight: FontWeight.w600,
              fontSize: 21),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 12,
            color: Colors.transparent,
          ),
          _item("账户安全", null),
          Container(
            height: 12,
            color: Colors.transparent,
          ),
          _item("清除应用缓存", "1.3M"),
          Divider(
            height: 0,
            thickness: 0.5,
          ),
          _item("隐私政策", null),
          Divider(
            height: 0,
            thickness: 0.5,
          ),
          _item("关于英大金融", "当前版本1.0"),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          _exitLoginBtn(),
          Container(
            height: 65,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }

  Widget _item(String title, String desc) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      height: 50,
      width: AppUtils.instance.screenW,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              title ?? "",
              style: TextStyle(
                  color: Color(ColorConstant.black444444),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          Offstage(
            offstage: desc == null,
            child: Container(
              margin: EdgeInsets.only(right: 8),
              child: Text(
                desc ?? "",
                style: TextStyle(
                    color: Color(ColorConstant.black444444),
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
          Image.asset(ImgConstantData.IMG_ICON_ARROW_RIGHT)
        ],
      ),
    );
  }

  Widget _exitLoginBtn() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          "退出登录",
          style: TextStyle(
              color: Color(ColorConstant.redFF584B),
              fontWeight: FontWeight.w600,
              fontSize: 21),
        ),
      ),
    );
  }
}
