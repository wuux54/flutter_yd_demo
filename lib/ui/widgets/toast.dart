import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_video_world/utils/utils_app.dart';

class Toast {
  static DateTime _dateTime;
  static OverlayEntry _overlayEntry;
  static bool _showing = false;

  static void show(BuildContext context, String msg) async {
    _showing = true;
    _dateTime = DateTime.now();
    if (_overlayEntry == null) {
      OverlayState _os = Overlay.of(context);
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Positioned(
                  child: Container(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: _showing ? 1.0 : 0.0, //目标透明度
                  duration: _showing
                      ? Duration(milliseconds: 100)
                      : Duration(milliseconds: 400),
                  child: textWidget(msg),
                ),
              )));
      _os.insert(_overlayEntry);
    } else {
      _overlayEntry.markNeedsBuild();
    }

    //等待2000
    await Future.delayed(Duration(milliseconds: 2000));

    if (DateTime.now().difference(_dateTime).inMilliseconds >= 2000) {
      _showing = false;
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }

  static Widget textWidget(String msg) {
    return Container(
      constraints: BoxConstraints(maxWidth: AppUtils.instance.screenW * 0.7),
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(5),
      child: Text(
        msg,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
