import 'package:flutter/material.dart';
import 'package:flutter_video_world/bean/common_list_bean.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/ui/item/item.dart';
import 'package:flutter_video_world/ui/widgets/toast.dart';
import 'package:flutter_video_world/utils/data/assemble.dart';
import 'package:flutter_video_world/utils/utils_app.dart';

/**
 * 理财页面
 */

class FiscalPage extends StatefulWidget {
  @override
  _FiscalPageState createState() => _FiscalPageState();
}

class _FiscalPageState extends State<FiscalPage>
    with AutomaticKeepAliveClientMixin {
//  bool sho
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<CommonListBean> list = List(4);
    list[0] = DataAssembleUtils.getTitleItem("为你精选");
    list[1] = DataAssembleUtils.getType5Item();
    list[2] = DataAssembleUtils.getType5Item();
    list[3] = DataAssembleUtils.getType5Item();

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
            "理财",
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _card(),
          ),
          SliverToBoxAdapter(
            child: _twoItem(),
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
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 7),
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
              color: Color(0xFFA1887F),
              offset: Offset(0, 4)),
        ],
        image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              ImgConstantData.IMG_FINANCIAL_CARD_BG,
            )),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: _switchEyes(),
          ),
          Container(
            height: 0.5,
            color: Colors.white,
            margin: EdgeInsets.only(top: 16, bottom: 7),
          ),
          _cardBottom()
        ],
      ),
    );
  }

  Widget _switchEyes() {
    return IndexedStack(
      alignment: Alignment.topLeft,
      index: isLogin ? 1 : 0,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      fontSize: 30),
                ),
              ),
              Image.asset(
                ImgConstantData.IMG_ICON_ARROW_RIGHT_WHITE,
                width: 15,
                height: 20,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Text("总金额(元)",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15)),
                ),
                GestureDetector(
                  child: Image.asset(
                    eyesIsOpen
                        ? ImgConstantData.IMG_FINANCIAL_CARD_EYE_OP
                        : ImgConstantData.IMG_FINANCIAL_CARD_EYE_CLOSE,
                    width: 19,
                    height: 12,
                    fit: BoxFit.fill,
                  ),
                  onTap: () {
                    setState(() {
                      eyesIsOpen = !eyesIsOpen;
                    });
                  },
                )
              ],
            ),
            Container(
              child: Text(
                eyesIsOpen ? "500.00" : "****",
                style: TextStyle(
                    color: Color(ColorConstant.whiteFFFEFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _cardBottomItem("昨日收益(元)", "100.00"),
        Container(
          color: Colors.white,
          width: 0.5,
          padding: EdgeInsets.only(top: 5, bottom: 5),
        ),
        _cardBottomItem("持有收益(元)", "100.00"),
        Container(
          color: Colors.white,
          width: 0.5,
          padding: EdgeInsets.only(top: 5, bottom: 5),
        ),
        _cardBottomItem("累计收益(元)", "100.00"),
      ],
    );
  }

  Widget _cardBottomItem(String title, String desc) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Color(ColorConstant.whiteFFFEFF),
                fontWeight: FontWeight.w400,
                fontSize: 11),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(isLogin ? (eyesIsOpen ? desc : "****") : "- -",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )),
          )
        ],
      ),
    );
  }

  Widget _twoItem() {
    return Container(
      margin: EdgeInsets.only(
          top: 4,
          bottom: 10,
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                //模糊的半径
                blurRadius: 5,
                color: Color(0xFFD6D6D6),
                offset: Offset(2, 3)),
            BoxShadow(
                //模糊的半径
                blurRadius: 5,
                color: Color(0xFFD6D6D6),
                offset: Offset(-2, -1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                ImgConstantData.IMG_FINANCIAL_ICON_BILL,
                width: 27,
                height: 30,
                fit: BoxFit.fill,
              ),
              Container(
                width: 3,
              ),
              Text(
                "收益明细",
                style: TextStyle(
                    color: Color(ColorConstant.black444444),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )
            ],
          ),
          Container(
            width: 0.2,
            color: Color(ColorConstant.brownB2957C),
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                ImgConstantData.IMG_FINANCIAL_ICON_TRANSACTION,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
              Container(
                width: 3,
              ),
              Text(
                "交易记录",
                style: TextStyle(
                    color: Color(ColorConstant.black444444),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }
}
