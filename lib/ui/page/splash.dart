import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/ui/page/main.dart';
import 'package:flutter_video_world/utils/utils_app.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 注册
    AppUtils.instance.init(context);
    return MaterialApp(
        theme: ThemeData(
            appBarTheme:AppBarTheme(color: Colors.transparent) ,
            accentColor: Colors.pink,
            backgroundColor: Colors.white,
            primaryColor: Colors.pink),
        home: Container(
          color: Colors.white,
          child: SplashStatePage(),
        ));
  }
}

class SplashStatePage extends StatefulWidget with WidgetsBindingObserver{
  @override
  _State createState() => _State();
}

class _State extends State<SplashStatePage> {
  int time = 5;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppUtils.instance.screenW,
      height: AppUtils.instance.screenH,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: new AssetImage(ImgConstantData.IMG_BG_SPLASH),
            fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            goMainPage();
          },
          child: Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(bottom: 15, right: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 2)),
            child: Text(
              "$time",
              style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Duration duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (time < 1) {
          goMainPage();
        } else {
          time -= 1;
        }
      });
    });
  }

  void goMainPage() {
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return MainPage();
    }), (router) => router == null);
  }
}
