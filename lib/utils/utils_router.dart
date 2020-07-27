import 'package:flutter/material.dart';
import 'package:flutter_video_world/ui/page/main.dart';
import 'package:flutter_video_world/ui/page/web.dart';

class RouterUtils {
  static const PAGE_MAIN = "ui.page:main";

  static Widget _getPage(String url, dynamic params) {
    if (url.startsWith("http://") || url.startsWith("https://")) {
      return WebPage(url);
    }
    switch (url) {
      case PAGE_MAIN:
        return MainPage();
    }
  }

//  static jumpPage(
//      BuildContext context, String url, dynamic params, bool removeCurr) {
//    removeCurr
//        ? Navigator.p(context,
//            MaterialPageRoute(builder: (BuildContext context) {
//            return _getPage(url, params);
//          }))
//        : Navigator.push(context,
//            MaterialPageRoute(builder: (BuildContext context) {
//            return _getPage(url, params);
//          }));
//  }
}
