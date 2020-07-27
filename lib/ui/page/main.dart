import 'package:flutter/material.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/ui/page/fiscal.dart';
import 'package:flutter_video_world/ui/page/home.dart';
import 'package:flutter_video_world/ui/page/mine.dart';
import 'package:flutter_video_world/ui/page/service/service.dart';
import 'insurance/insurance.dart';

const List<String> items = ["首页", "理财", "保险", "服务", "我的"];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages;

  int currIndex = 0;

  PageController _controller;

  @override
  void initState() {
    super.initState();
    if (_controller == null) {
      _controller = PageController(initialPage: currIndex, keepPage: true);
    }
    if (pages == null) {
      pages = [
        HomePage(),
        FiscalPage(),
        InsurancePage(),
        ServicePage(),
        MinePage(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomItem(),
    );
  }

  Widget _bodyWidget() {
    return PageView(
      controller: _controller,
      children: pages,
      onPageChanged: (int page) {
        setState(() {
          currIndex = page;
        });
      },
    );
  }

  Widget _bottomItem() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Color(ColorConstant.bgNor),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _bottomWidget(0, ImgConstantData.IMG_ICON_HOME,
              ImgConstantData.IMG_ICON_HOME_SELECT),
          _bottomWidget(1, ImgConstantData.IMG_ICON_FINANCIAL,
              ImgConstantData.IMG_ICON_FINANCIAL_SELECT),
          _bottomWidget(2, ImgConstantData.IMG_ICON_INSURANCE,
              ImgConstantData.IMG_ICON_INSURANCE_SELECT),
          _bottomWidget(3, ImgConstantData.IMG_ICON_SERVICE,
              ImgConstantData.IMG_ICON_SERVICE_SELECT),
          _bottomWidget(4, ImgConstantData.IMG_ICON_MY,
              ImgConstantData.IMG_ICON_MY_SELECT),
        ],
      ),
    );
  }

  Widget _bottomWidget(int index, String icon, String iconActive) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              currIndex == index ? iconActive : icon,
              width: 25,
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: currIndex == index
                      ? Color(0xFF444444)
                      : Color(0xFF898A96),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          currIndex = index;
          _controller.jumpToPage(currIndex);
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
