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
 * 保险页面
 */

class InsurancePage extends StatefulWidget {
  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  int currIndex = 0;
  var _pageController;
  List<Widget> pageList;
  List<CommonListBean> list = List(10);

//  bool sho
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (pageList == null) {
      pageList = [_list(), _list(), _list(), _list()];
    }

    if (_pageController == null) {
      _pageController = new TabController(length: pageList.length, vsync: this);
    }

    list[0] = DataAssembleUtils.getTitleItem("王牌理财限量抢");
    list[1] = DataAssembleUtils.getType1Item();

    list[2] = DataAssembleUtils.getTitleItem("人气热销好保障");
    list[3] = DataAssembleUtils.getType2Item();

    list[4] = DataAssembleUtils.getTitleItem("理赔类型");
    list[5] = DataAssembleUtils.getType4Item();

    list[6] = DataAssembleUtils.getTitleItem("资讯");
    list[7] = DataAssembleUtils.getType3Item();
    list[8] = DataAssembleUtils.getType3Item();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Text(
                "保险",
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
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 5),
                child: Text(
                  "客服电话",
                  style: TextStyle(
                      color: Color(ColorConstant.black444444),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
            ),
          ],
        ),
      ),

      //NestedScrollView ： body 内部如果有是外部非滑动组件+内置listView时会抢夺焦点
      // 活动内部list头部不会跟着动
      body: NestedScrollView(
        controller: ScrollController(),
        headerSliverBuilder: _headerSliver,
        body: TabBarView(
          controller: _pageController,
          children: pageList,
        ),
      ),
    );
  }

  bool isLogin = true;
  bool eyesIsOpen = true;

  //布局，父容器必须给子widget配置位置。
  // 比如Alignment.center 让子widget能布局，否则其宽度会扩充父容器到大小
  Widget _card() {
    //三种状态：未登录，登录-eyesClose，登录-eyesOpen
    return Container(
      height: 150,
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: 10,
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin,
          top: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              //模糊的半径
              blurRadius: 6,
              color: Color(0xFF12BCCE),
              offset: Offset(0, 4)),
//          BoxShadow(
//              //模糊的半径
//              blurRadius: 3,
//              color: Color(0xFF12BCCE),
//              offset: Offset(0, 0))
        ],
        image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              ImgConstantData.IMG_INSURANCE_CARD_BG,
            )),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: _switchTips(),
          ),
          Container(
            height: 0.5,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
          ),
          _cardBottom()
        ],
      ),
    );
  }

  Widget _switchTips() {
    return IndexedStack(
      alignment: Alignment.centerLeft,
      index: isLogin ? 1 : 0,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  right: 5,
                ),
                child: Text(
                  "请登录",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 21),
                ),
              ),
              Image.asset(
                ImgConstantData.IMG_ICON_ARROW_RIGHT_WHITE,
                width: 10,
                height: 20,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  right: 5,
                ),
                child: Text(
                  "保障中",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cardBottom() {
    return Container(
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "历史保单",
                  style: TextStyle(
                      color: Color(ColorConstant.whiteFFFEFF),
                      fontWeight: FontWeight.w400,
                      fontSize: 11),
                )),
            Container(
              color: Colors.white,
              width: 0.5,
              margin: EdgeInsets.only(left: 24, right: 16),
              padding: EdgeInsets.only(top: 5, bottom: 5),
            ),
            Center(
                child: Text(
              "风险测评",
              style: TextStyle(
                  color: Color(ColorConstant.whiteFFFEFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 11),
            )),
          ],
        ));
  }

  List<Widget> _headerSliver(BuildContext context, bool l) {
    return <Widget>[
      SliverToBoxAdapter(
        child: _card(),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: getItemByType(DataAssembleUtils.getType9Item(), (bean) {}),
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
//        //列表滑动不立刻跟随
        floating: true,
        delegate: TabBarSliverVerticalDelegate(TabBar(
            isScrollable: true,
            labelColor: Color(ColorConstant.black444444),
            controller: _pageController,
            unselectedLabelColor: Color(ColorConstant.grey999999),
            labelStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color(ColorConstant.black444444),
            indicatorWeight: 3,
            labelPadding: EdgeInsets.only(bottom: 5, right: 10,top: 5),
            indicatorPadding: EdgeInsets.only(right: 10),
            tabs: [
              Text(
                "健康",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "出行",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "意外",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "财产",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ])),
      ),
    ];
  }

  Widget _list() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index != list.length - 1) {
          return getItemByType(list[index], (CommonListBean data) {
            Toast.show(context, "----> ${data.specialType}");
          });
        } else {
          return bottomTipsWidget();
        }
      },
      itemCount: list.length,
    );
  }
}
