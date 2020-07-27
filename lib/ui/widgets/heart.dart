import 'package:flutter/material.dart';

class HeartAnimatedWidget extends StatefulWidget {
  Offset offset;
  Size size;

  HeartAnimatedWidget({@required this.offset, @required this.size})
      : assert(size != null);

  @override
  _HeartAnimatedWidgetState createState() => _HeartAnimatedWidgetState();
}

class _HeartAnimatedWidgetState extends State<HeartAnimatedWidget> {
  Offset position;

  @override
  Widget build(BuildContext context) => Listener(
        onPointerDown: (event) {
          position = event.localPosition;
          setState(() {});
        },
        behavior: HitTestBehavior.deferToChild,
        child: CustomPaint(
          size: widget.size,
          painter: HeartPainter(offset: position),
        ),
      );
}

class HeartPainter extends CustomPainter {
  Offset offset;

  HeartPainter({this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    double pointRadius = 8;
    var paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.white;
    var react = Offset.zero & Size(180,170);

    //背景板
    canvas.drawRect(react, paint);
    paint.color = Colors.red;
    Path path = new Path();

    canvas.drawPath(_heartPath(), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Path _heartPath() {
    double width = 180;
    double height = 170;
    var path = new Path();
    //三阶贝塞尔函数
    Offset centerTop = Offset(width / 2, height / 3);
    Offset centerBottom = Offset(width / 2,height);

    Offset right1 = Offset((width * 11) /12, 0);
    Offset left1 = Offset(width / 12, 0);

    Offset right2 = Offset(width, (height * 5) / 7);
    Offset left2 = Offset(0,(height * 5) /7);


    path.moveTo(centerTop.dx, centerTop.dy);
    path.cubicTo(right1.dx, right1.dy, right2.dx, right2.dy, centerBottom.dx, centerBottom.dy);

    path.moveTo(centerTop.dx, centerTop.dy);
    path.cubicTo(left1.dx, left1.dy, left2.dx, left2.dy, centerBottom.dx, centerBottom.dy);


    return path;
  }
}
