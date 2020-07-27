import 'package:flutter/material.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/ui/widgets/toast.dart';
import 'package:flutter_video_world/utils/utils_app.dart';
import 'package:flutter_video_world/utils/utils_router.dart';

import 'setting.dart';

List tabs = ["新闻", "历史", "图片"];

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        Image.asset(
          ImgConstantData.IMG_MY_BG_ME,
          height: 233,
          width: AppUtils.instance.screenW,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingPage())).then((data){
                        Toast.show(context, "data");
                  print("data-->$data");
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: SizeConstant.allBorderMargin),
                  child: Image.asset(
                    ImgConstantData.IMG_MY_ICON_SET,
                    width: 30,
                    height: 30,
                  ),
                ),
              )
            ],
            elevation: 0,
            title: Text(
              "我的",
              style: TextStyle(
                  color: Color(ColorConstant.black444444),
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: _headerWidget(),
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: EdgeInsets.only(
                      left: SizeConstant.allBorderMargin,
                      right: SizeConstant.allBorderMargin),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财"),
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财"),
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财"),
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财",
                          needDivider: false),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: EdgeInsets.only(
                      top: 12,
                      left: SizeConstant.allBorderMargin,
                      right: SizeConstant.allBorderMargin),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财"),
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财"),
                      _item(ImgConstantData.IMG_MY_ICON_FINA, "我的理财",
                          needDivider: false),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _item(String icon, String title, {bool needDivider = true}) {
    return Container(
      height: 50,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Image.asset(
              icon,
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Color(ColorConstant.black444444),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 18),
                        child:
                            Image.asset(ImgConstantData.IMG_ICON_ARROW_RIGHT),
                      )
                    ],
                  ),
                ),
                Offstage(
                  offstage: !needDivider,
                  child: Divider(
                    height: 0,
                    thickness: 0.5,
                    color: Color(ColorConstant.whiteEEEEEE),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      margin: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              ImgConstantData.IMG_MY_DEF_HEAD,
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "迪丽热巴",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(ColorConstant.black444444)),
              ),
              Text(
                "133****7643",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(ColorConstant.black444444)),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          _headerButton(),
        ],
      ),
    );
  }

  Widget _headerButton() => Container(
        padding: EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(ColorConstant.yellowFFD743),
            Color(ColorConstant.yellowFFF07D)
          ]),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(ImgConstantData.IMG_MY_ICON_MONEY,
                width: 13, height: 15),
            Text(
              "我的账单",
              style: TextStyle(
                  color: Color(ColorConstant.black333333),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        ),
      );
}
