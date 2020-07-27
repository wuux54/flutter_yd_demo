import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_video_world/bean/common_list_bean.dart';
import 'package:flutter_video_world/bean/request/nor_request.dart';
import 'package:flutter_video_world/bean/response/products_bean.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/listener/net_data_listener.dart';
import 'package:flutter_video_world/net/http_manager.dart';
import 'package:flutter_video_world/net/net_exception.dart';
import 'package:flutter_video_world/ui/widgets/toast.dart';
import 'package:flutter_video_world/utils/data/assemble.dart';
import 'package:flutter_video_world/utils/utils_app.dart';
import 'package:flutter_video_world/utils/utils_log.dart';
import 'package:flutter_video_world/ui/item/item.dart';

List tabs = ["新闻", "历史", "图片"];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
    List<CommonListBean> list = List(11);
    list[0] = DataAssembleUtils.getType9Item();
    list[1] = DataAssembleUtils.getTitleItem("王牌理财限量抢");
    list[2] = DataAssembleUtils.getType1Item();

    list[3] = DataAssembleUtils.getTitleItem("人气热销好保障");
    list[4] = DataAssembleUtils.getType2Item();

    list[5] = DataAssembleUtils.getTitleItem("理赔类型");
    list[6] = DataAssembleUtils.getType4Item();

    list[7] = DataAssembleUtils.getTitleItem("资讯");
    list[8] = DataAssembleUtils.getType3Item();
    list[9] = DataAssembleUtils.getType3Item();
    list[10] = DataAssembleUtils.getType3Item();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(ColorConstant.redFF6458),
        elevation: 0,
        title: Text(
          "登录",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
        ),
      ),
      body: EasyRefresh(
        onRefresh: () {},
        controller: EasyRefreshController(),
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                width: AppUtils.instance.screenW,
                color: Color(ColorConstant.bgNor),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      ImgConstantData.IMG_BG_HOME_RED,
                      fit: BoxFit.fill,
                      width: AppUtils.instance.screenW,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15,
                          left: SizeConstant.allBorderMargin,
                          right: SizeConstant.allBorderMargin),
                      child: Image.asset(ImgConstantData.IMG_BG_HOME_BANNER,
                          fit: BoxFit.fill, width: AppUtils.instance.screenW),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _moduleWidget(),
            ),
            SliverToBoxAdapter(
              child: _gridWidget(),
            ),
            new SliverList(
              delegate: new SliverChildBuilderDelegate((context, index) {
                return getItemByType(list[index], (CommonListBean data) {
                  Toast.show(context, "----> ${data.specialType}");
                });
              }, childCount: list.length),
            ),
            SliverToBoxAdapter(
              child: bottomTipsWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget _moduleWidget() {
    return Container(
      color: Color(ColorConstant.bgNor),
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                ImgConstantData.IMG_ICON_HOME_FUND,
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "基金开户",
                  style: TextStyle(
                      color: Color(ColorConstant.black444444),
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                ImgConstantData.IMG_ICON_HOME_SECURITIES,
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "证券开户",
                  style: TextStyle(
                      color: Color(ColorConstant.black444444),
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                ImgConstantData.IMG_ICON_HOME_NOTICE,
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "通告",
                  style: TextStyle(
                      color: Color(ColorConstant.black444444),
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                ImgConstantData.IMG_ICON_HOME_CUSTOMER_SERVICE,
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "客服",
                  style: TextStyle(
                      color: Color(ColorConstant.black444444),
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gridWidget() {
    return Container(
      color: Color(ColorConstant.bgNor),
      padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(
              ImgConstantData.IMG_HOME_BG_SIGN,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 10,
            color: Colors.transparent,
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              ImgConstantData.IMG_HOME_BG_GIFT,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
