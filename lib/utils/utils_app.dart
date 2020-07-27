import 'dart:ui';

import 'package:flutter/material.dart';

class AppUtils {
  static AppUtils _appUtils;

  //设计稿的设备尺寸修改
  double width;

  double height;

  bool allowFontScaling;

  MediaQueryData _mediaQueryData;
  double _screenWidth;
  double _screenHeight;
  double _pixelRatio;
  double _statusBarHeight;

  double _bottomBarHeight;

  double _textScaleFactor;

  // factory 修饰构造，new 的对象都是同一个。表示为：单例
//  factory  AppUtils()  => _appUtils;

  AppUtils._(
      {this.width = 375, this.height = 710, this.allowFontScaling = false}) {}

  static AppUtils _createInstance() {
    if (_appUtils == null) {
      _appUtils = new AppUtils._();
    }
    return _appUtils;
  }

  static AppUtils get instance => _createInstance();

  //context 得在StatelessWidget中
  void init(BuildContext context) {
//    MediaQueryData mediaQuery = MediaQuery.of(context);
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  MediaQueryData get mediaQueryData => _mediaQueryData;

  ///每个逻辑像素的字体像素数，字体的缩放比例
  double get textScaleFactory => _textScaleFactor;

  ///设备的像素密度
  double get pixelRatio => _pixelRatio;

  ///当前设备宽度 dp
  double get screenW => _screenWidth;

  ///当前设备高度 dp
  double get screenH => _screenHeight;

  ///状态栏高度 dp
  double get screenAppStatus => _statusBarHeight;

  ///底部安全区距离 dp
  double get bottomBarHeight => _bottomBarHeight;

  ///当前设备宽度 px
  double get screenWidthPx => _screenWidth * _pixelRatio;

  ///当前设备高度 px
  double get screenHeightPx => _screenHeight * _pixelRatio;

  ///状态栏高度 刘海屏会更高
  double get statusBarHeightPx => _statusBarHeight * _pixelRatio;

  ///底部安全区距离
  double get bottomBarHeightPx => _bottomBarHeight * _pixelRatio;

  ///实际的dp与设计稿px的比例
  get scaleWidth => _screenWidth / width;

  get scaleHeight => _screenHeight / height;

  ///根据设计稿的设备宽度适配
  ///高度也根据这个来做适配可以保证不变形
  setWidth(double width) => width * scaleWidth;

  /// 根据设计稿的设备高度适配
  /// 当发现设计稿中的一屏显示的与当前样式效果不符合时,
  /// 或者形状有差异时,高度适配建议使用此方法
  /// 高度适配主要针对想根据设计稿的一屏展示一样的效果
  setHeight(double height) => height * scaleHeight;

  ///字体大小适配方法
  ///@param fontSize 传入设计稿上字体的px ,
  ///@param allowFontScaling 控制字体是否要根据系统的“字体大小”辅助选项来进行缩放。默认值为true。
  ///@param allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is true.
  setSp(double fontSize) => allowFontScaling
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;
}
