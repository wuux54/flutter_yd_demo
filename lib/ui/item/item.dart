import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_world/bean/common_list_bean.dart';
import 'package:flutter_video_world/bean/response/products_bean.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/constant/net_constant.dart';
import 'package:flutter_video_world/utils/utils_app.dart';
import 'package:flutter_video_world/ui/widgets/nor_widget.dart';

typedef TapCallBack = void Function(CommonListBean data);

Widget ads9Widget(final CommonListBean data, TapCallBack _callBack) {
  return GestureDetector(
    onTap: () {
      _callBack(data);
    },
    child: Container(
      color: Color(ColorConstant.bgNor),
      padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Image.asset(
        data.imgUri,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget title(final CommonListBean data, TapCallBack _callBack) {
  return Container(
    padding: EdgeInsets.only(
        left: SizeConstant.allBorderMargin,
        right: SizeConstant.allBorderMargin,
        top: 15,
        bottom: 10),
    width: AppUtils.instance.screenW,
    color: Color(ColorConstant.bgNor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              data.contentName,
              style: TextStyle(
                  color: Color(ColorConstant.black444444),
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            Container(
              width: 5,
            ),
            Visibility(
              visible: data.imgUri != null,
              child: Image.asset(
                data.imgUri ?? "",
                width: 15,
                height: 15,
              ),
            ),
          ],
        ),
        //Visibility：不可见时，可设置是否占用空间，是否维持内容的活动比如动画。 Offstage ：不可见时仍然保持活动，但是不占用父空间
        Visibility(
          visible: data.contentDesc != null,
          child: GestureDetector(
            onTap: () {
              _callBack(data);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                data.contentDesc ?? "",
                style: TextStyle(
                    color: Color(ColorConstant.grey898A96),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget bottomTipsWidget() {
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 40),
    color: Color(ColorConstant.bgNor),
    child: Center(
      child: Column(
        children: <Widget>[
          Text(
            "国网英大集团线上金融服务平台",
            style: TextStyle(
              color: Color(ColorConstant.blackBCC1C9),
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "为您提供专业放心的金融服务",
            style: TextStyle(
              color: Color(ColorConstant.blackBCC1C9),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _cardWidget(final ProductsBean data) {
  List<String> bottomLabel = data.productDes.split(" ");
  return Card(
    margin: EdgeInsets.only(right: 10, bottom: 13),
    color: Color(ColorConstant.bgNor),
    elevation: 5,
    child: Container(
      width: 130,
      height: 120,
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 10,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                data.productName,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(ColorConstant.black444444)),
              ),
              Visibility(
                visible: data.isFire == 1,
                child: labelWidget(),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data.productCount + data.unit,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Color(ColorConstant.redFF584B)),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data.productAtt,
                style: TextStyle(
                    fontSize: 11, color: Color(ColorConstant.grey898A96)),
              )),
          bottomWidget(ColorConstant.brownB69A85, ColorConstant.brownB69A85,
              bottomLabel[0], bottomLabel.length > 1 ? bottomLabel[1] : null),
        ],
      ),
    ),
  );
}

Widget hList1Widget(final CommonListBean data, TapCallBack _callBack) {
  if (data == null) {
    return Container(
      padding: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      color: Color(ColorConstant.bgNor),
    );
  }
  return Container(
      height: 133,
      width: double.infinity,
      alignment: Alignment.topLeft,
      color: Color(ColorConstant.bgNor),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: SizeConstant.allBorderMargin, right: 10),
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 5, color: Color(ColorConstant.bgNor));
        },
        itemBuilder: (BuildContext context, int index) {
          ProductsBean bean = data.products[index];
          return GestureDetector(
            onTap: () {
              CommonListBean commonListBean = new CommonListBean();
              commonListBean.productsBean = bean;
              _callBack(data);
            },
            child: _cardWidget(bean),
          );
        },
        itemCount: data.products.length,
      ));
}

Widget item2Widget(CommonListBean data, TapCallBack _callBack) {
  ProductsBean productsBean = data.productsBean;
  String leftLabel = null;
  String rightLabel = null;
  if (productsBean.productDes != null) {
    List<String> label = productsBean.productDes.split(" ");
    leftLabel = label[0];
    rightLabel = label.length > 1 ? label[1] : null;
  }
  return GestureDetector(
    child: Container(
      color: Color(ColorConstant.bgNor),
      width: AppUtils.instance.screenW,
      padding: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Column(
        children: <Widget>[
          Container(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        data.productsBean.productCount,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(ColorConstant.redFF584B)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Text(data.productsBean.unit,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(ColorConstant.redFF584B))),
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  bottomWidget(ColorConstant.blue5788FF,
                      ColorConstant.redFF584B, leftLabel, rightLabel),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 17,
                  ),
                  Text(data.productsBean.productName,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(ColorConstant.black444444))),
                  Container(
                    height: 3,
                  ),
                  Text(
                    data.productsBean.productAtt,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(ColorConstant.grey898A96),
                    ),
                  ),
                  Container(
                    height: 16,
                  ),
                ],
              ),
              Center(
                widthFactor: 3,
                child: Image.asset(
                  ImgConstantData.IMG_ICON_ARROW_RIGHT,
                  fit: BoxFit.fitHeight,
                  height: 17,
                ),
              )
            ],
          ),
          Container(
            height: 5,
          ),
          Divider(
            height: 1,
            color: Color(ColorConstant.whiteEEEEEE),
          ),
        ],
      ),
    ),
    onTap: () {
      _callBack(data);
    },
  );
}

Widget item4Widget(CommonListBean data, TapCallBack _callBack) {
  ProductsBean productsBean = data.productsBean;
  String leftLabel = null;
  String rightLabel = null;
  if (productsBean.productDes != null) {
    List<String> label = productsBean.productDes.split(" ");
    leftLabel = label[0];
    rightLabel = label.length > 1 ? label[1] : null;
  }
  return GestureDetector(
    onTap: () {
      _callBack(data);
    },
    child: Container(
      color: Color(ColorConstant.bgNor),
      width: AppUtils.instance.screenW,
      padding: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 17,
                      ),
                      Text(data.productsBean.productName,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(ColorConstant.black444444))),
                      Container(
                        height: 3,
                      ),
                      Text(
                        data.productsBean.productAtt,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(ColorConstant.grey898A96),
                        ),
                      ),
                    ],
                  ),
                  bottomWidget(ColorConstant.blue5788FF,
                      ColorConstant.redFF584B, leftLabel, rightLabel),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: btnWidget("申请"),
              )
            ],
          ),
          Container(
            height: 10,
          ),
          Divider(
            height: 2,
            color: Color(ColorConstant.whiteEEEEEE),
          ),
        ],
      ),
    ),
  );
}

Widget item3Widget(CommonListBean data, TapCallBack _callBack) {
  return GestureDetector(
    onTap: () {
      _callBack(data);
    },
    child: Container(
      color: Color(ColorConstant.bgNor),
      width: AppUtils.instance.screenW,
      padding: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(data.contentName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(ColorConstant.black444444))),
                        height: 48,
                        margin: EdgeInsets.only(bottom: 3),
                      ),
                      Text(
                        data.contentTime + "  " + data.contentDesc,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(ColorConstant.grey898A96),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    data.imgUri,
                    width: 112,
                    height: 80,
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: 2,
            color: Color(ColorConstant.whiteEEEEEE),
          ),
        ],
      ),
    ),
  );
}

Widget item5Widget(CommonListBean data, TapCallBack _callBack) {
  ProductsBean productsBean = data.productsBean;
  return GestureDetector(
    onTap: () {
      _callBack(data);
    },
    child: Container(
      color: Color(ColorConstant.bgNor),
      width: AppUtils.instance.screenW,
      padding: EdgeInsets.only(
          left: SizeConstant.allBorderMargin,
          right: SizeConstant.allBorderMargin),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        child: Text(
                          productsBean.productCount + productsBean.unit,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Color(ColorConstant.redFF584B)),
                        ),
                      ),
                      Visibility(
                        visible: productsBean.isFire == NetConstant.FIRE_TYPE_1,
                        child: labelWidget(),
                      ),
                    ],
                  ),
                  Text(
                    productsBean.productDes ?? "",
                    style: TextStyle(
                        fontSize: 11, color: Color(ColorConstant.grey898A96)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 17,
                  ),
                  Text(data.productsBean.productName,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(ColorConstant.black444444))),
                  Container(
                    height: 3,
                  ),
                  Text(
                    data.productsBean.productAtt,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(ColorConstant.grey898A96),
                    ),
                  ),
                  Container(
                    height: 16,
                  ),
                ],
              ),
              Center(
                widthFactor: 3,
                child: Image.asset(
                  ImgConstantData.IMG_ICON_ARROW_RIGHT,
                  fit: BoxFit.fitHeight,
                  height: 17,
                ),
              )
            ],
          ),
          Container(
            height: 10,
          ),
          Divider(
            height: 2,
            color: Color(ColorConstant.whiteEEEEEE),
          ),
        ],
      ),
    ),
  );
}

Widget getItemByType(final CommonListBean data, TapCallBack _callBack) {
  switch (data.specialType) {
    case TypeConstant.TYPE_COMMON_LIST_TITLE:
      return title(data, _callBack);
    case TypeConstant.TYPE_COMMON_LIST_1:
      return hList1Widget(data, _callBack);
    case TypeConstant.TYPE_COMMON_LIST_2:
      return item2Widget(data, _callBack);
    case TypeConstant.TYPE_COMMON_LIST_3:
      return item3Widget(data, _callBack);
    case TypeConstant.TYPE_COMMON_LIST_4:
      return item4Widget(data, _callBack);
    case TypeConstant.TYPE_COMMON_LIST_5:
      return item5Widget(data, _callBack);
    case TypeConstant.TYPE_COMMON_LIST_ADS_9:
      return ads9Widget(data, _callBack);
    default:
      return Container();
      break;
  }
}
