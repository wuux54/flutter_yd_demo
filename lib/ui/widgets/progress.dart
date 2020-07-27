import 'dart:math';

import 'package:flutter/material.dart';

class ProgressWidgetTest extends StatelessWidget {
  final List<Color> colors;

  //[0.0 ,1.0] 升序递增
  final List<double> stops;

  //进度
  final double value;

  //总角度 2*pi 整圆
  final double totalAngle;

  final double strokeWidth;

  final double radius;

  final Color bgColor;

  final bool strokeCapRound;

  ProgressWidgetTest(
      {@required this.radius,
      this.colors,
      this.stops,
      this.value = 0,
      this.totalAngle = 2 * pi,
      this.strokeWidth = 2,
      this.bgColor = Colors.grey,
      this.strokeCapRound = false})
      : assert(radius != null);

  @override
  Widget build(BuildContext context) {
    var _colors = colors;
    if (_colors == null) {
      _colors = [Theme.of(context).accentColor, Theme.of(context).accentColor];
    }

    //设置圆角，会导致起始位置偏离.获取偏离距离
    double _offset = 0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }

    //这里使用偏转，是因为起始点应该从正上方开始 逆时针旋转
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: Container(
        child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: MyProgressPointer(
              sWidth: strokeWidth,
              bgColor: bgColor,
              totalAngle: totalAngle,
              value: value,
              radius: radius,
              strokeCpaRound: strokeCapRound,
              stops: stops,
              colors: _colors),
        ),
      ),
    );
  }
}

class MyProgressPointer extends CustomPainter {
  List<Color> colors;

  List<double> stops;
  Color bgColor;

  double sWidth;
  double totalAngle;
  double value;
  double radius;
  bool strokeCpaRound;

  MyProgressPointer(
      {this.totalAngle,
      @required this.value,
      this.bgColor = Colors.grey,
      @required this.sWidth,
      @required this.colors,
      this.stops,
      this.radius,
      this.strokeCpaRound = false});

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      //以半径画出rect
      size = Size.fromRadius(radius);
    }

    double startAngle = .0;
    double _offset = sWidth / 2.0;

    //特殊算法，之后看看
    if (strokeCpaRound) {
      startAngle = asin(sWidth / (size.width - sWidth));
    }

    //设置圆外圈设置在矩形的中间
    Rect rect = Offset(_offset, _offset) &
        Size(size.width - sWidth, size.height - sWidth);

    //value 设置进度比例
    double _value = value ?? .0;
    //返回0-1.0范围数值 [0，1]
    _value = _value.clamp(0, 1.0) * totalAngle;

    //绘制
    var paint = Paint()
      ..strokeCap = strokeCpaRound ? StrokeCap.round : StrokeCap.butt
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = sWidth;

    //绘制背景
    if (bgColor != Colors.transparent) {
      paint.color = bgColor;
      //useCenter : true: 最后要连接到圆中心点
      //flutter 用 pi 来表示角度 pi = 180 °；
      canvas.drawArc(rect, startAngle, totalAngle, false, paint);
    }

    //绘制前景
    if (value > 0) {
      //画出渐变色
      paint.shader = SweepGradient(
              startAngle: 0.0,
              endAngle: _value,
              //stops:必须长度与colors相同，设置每个colors的分配比例,升序 0.0-1.0，
              // 如果后一位小于前一位，则设置跟前一位值相同
              // null为均匀分配颜色
              stops: stops,
              colors: colors)
          .createShader(rect);

      canvas.drawArc(rect, startAngle, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


  
}
