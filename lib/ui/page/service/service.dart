import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_world/bean/common_list_bean.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/ui/item/item.dart';
import 'package:flutter_video_world/ui/page/home.dart';
import 'package:flutter_video_world/ui/page/main.dart';
import 'package:flutter_video_world/ui/page/mine.dart';
import 'package:flutter_video_world/ui/widgets/toast.dart';
import 'package:flutter_video_world/utils/data/assemble.dart';
import 'package:flutter_video_world/utils/utils_app.dart';

import '../../nor_sliver_persistent_header_delegate.dart';

/**
 * 服务页面
 */

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  int currIndex = 0;
  List<CommonListBean> list = List(3);

//  bool sho
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    list[0] = DataAssembleUtils.getTitleItem("特色服务");
    list[1] = DataAssembleUtils.getType4Item();
    list[2] = DataAssembleUtils.getType4Item();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          child: Divider(
            height: 0.5,
            color: Color(ColorConstant.whiteEEEEEE),
          ),
          preferredSize: Size(AppUtils.instance.screenW, 0.5),
        ),
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          child: Text(
            "服务",
            style: TextStyle(
                color: Color(ColorConstant.black444444),
                fontWeight: FontWeight.w600,
                fontSize: 21),
          ),
          onTap: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
        ),
      ),

      //NestedScrollView ： body 内部如果有是外部非滑动组件+内置listView时会抢夺焦点
      // 活动内部list头部不会跟着动
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _card(),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return getItemByType(list[index], (CommonListBean data) {
                Toast.show(context, "----> ${data.specialType}");
              });
            },
            childCount: list.length,
          )),
          SliverToBoxAdapter(
            child: bottomTipsWidget(),
          )
        ],
      ),
    );
  }

  bool isLogin = true;

  //布局，父容器必须给子widget配置位置。
  // 比如Alignment.center 让子widget能布局，否则其宽度会扩充父容器到大小
  Widget _card() {
    //三种状态：未登录，登录-eyesClose，登录-eyesOpen
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
              //模糊的半径
              blurRadius: 6,
              color: Color(0xFF198662),
              offset: Offset(0, 4)),
        ],
      ),
      margin: EdgeInsets.only(
          bottom: 10,
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin,
          top: 12),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    ImgConstantData.IMG_SECURITY_CARD_BG,
                  )),
            ),
            height: 150,
            padding: EdgeInsets.only(
                left: 23,
                right: 23,
                top: 28,
                bottom: 20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 11,
                      child: Image.asset(
                        ImgConstantData.IMG_SERVE_ICON_S,
                        width: 14,
                        height: 14,
                        fit: BoxFit.fitWidth,
                      ),
                      backgroundColor: Color(ColorConstant.green076D4B),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text(
                        "证券开户",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "开户即可尽享资产增值",
                    style: TextStyle(
                        color: Color(ColorConstant.whiteFFFEFF), fontSize: 12),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                      color: Colors.white),
                  child: Text(
                    "立即开户",
                    style: TextStyle(
                        color: Color(ColorConstant.green107D5D),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          _cardBottom()
        ],
      ),
    );
  }

  Widget _cardBottom() {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(6),
                bottomLeft: Radius.circular(6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _cardBottomItem(
                ImgConstantData.IMG_SERVE_ICON_GIFT, "尊享产品", "回报连着赚"),
            _cardBottomItem(
                ImgConstantData.IMG_SERVE_ICON_GIFT, "尊享产品", "回报连着赚"),
            _cardBottomItem(
                ImgConstantData.IMG_SERVE_ICON_GIFT, "尊享产品", "回报连着赚"),
          ],
        ));
  }


  Widget _cardBottomItem(String url, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(url, width: 18, height: 18),
        Container(
          width: 2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(ColorConstant.green54BB88)),
            ),
            Text(
              desc,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(ColorConstant.green43B47C)),
            )
          ],
        ),
      ],
    );
  }
}
