import 'package:flutter/material.dart';
import 'package:flutter_video_world/ui/widgets/progress.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    bool isForward;
    if (_controller == null) {
      _controller =
          AnimationController(duration: Duration(seconds: 3), vsync: this);
      _controller.addStatusListener((AnimationStatus animationStatus) {
        if (animationStatus == AnimationStatus.forward) {
          isForward = true;
        } else if (animationStatus == AnimationStatus.completed ||
            animationStatus == AnimationStatus.dismissed) {
          if (isForward) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        } else if (animationStatus == AnimationStatus.reverse) {
          isForward = false;
        }
      });
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, chile) {
        return Center(
          child: ProgressWidgetTest(
            stops: [0, 0.45, 0.75, 1.0],
            colors: [Colors.green,
              Colors.cyanAccent,
              Colors.amber,
              Colors.red],
            strokeCapRound: true,
            strokeWidth: 10,
            radius: 100,
            value: _controller.value,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}

//painter 绘制练习
class CustomPainterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //格子宽高
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //绘制背景盘
    var paintBg = Paint()
    //填充
      ..style = PaintingStyle.fill
    //抗锯齿
      ..isAntiAlias = false
    //背景色
      ..color = Colors.amber;
    //Offset.zero & size 返回值是以Offset.zero为leftTop 坐标，以size为宽高的矩形
    canvas.drawRect(Offset.zero & size, paintBg);

    var columnPaint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..color = Colors.black;
    for (double i = 0; i <= size.width;) {
      var dx = i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), columnPaint);
      i += eWidth;
    }

    for (double i = 0; i <= size.height;) {
      var dy = i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), columnPaint);
      i += eHeight;
    }

    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.black;

    canvas.drawCircle(Offset(140, 140), 10, circlePaint);
    circlePaint.color = Colors.white;
    canvas.drawCircle(Offset(140, 160), 10, circlePaint);
  }

  //是否重绘，避免额外内存开销
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
