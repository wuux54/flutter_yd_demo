
import 'dart:core';
import 'package:flutter_video_world/bean/response/products_bean.dart';

/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/11/26
 * @E-mail: W_SpongeBob@163.com
 * @Desc：
 */
 class CommonListResponse {

   List<ListBean> _list;

   List<ListBean> get list => _list;

   set list(List<ListBean> value) {
     _list = value;
   }


 }

class ListBean {
  /**
   * 分类ui类型
   */
  int _classifyUiType;

  /**
   * 分类名是否展示 0 展示，1 不展示
   */
  int _isShow;

  /**
   * classifyId : 1
   * classifyName : 王牌理财限量购
   * classifyPicture :
   * products : [{"classify":"1","classifyName":"王牌理财限量购","createTime":"2019-11-22 15:37:19","id":"1","isFire":1,"isGw":0,"isShow":1,"isSort":0,"page":1,"productAtt":"年化收益率","productCode":"000912","productCount":"","productDes":"七天优选 每周付息","productName":"工资宝","productType":5,"productUrl":"http://www.baidu.com","rows":10,"sort":1,"unit":"%","updateTime":"2019-11-25 09:57:52"}]
   */

  String _classifyId;
  String _classifyName;
  String _classifyPicture;
  List<ProductsBean> _products;

  int get classifyUiType => _classifyUiType;

  set classifyUiType(int value) {
    _classifyUiType = value;
  }

  int get isShow => _isShow;

  set isShow(int value) {
    _isShow = value;
  }

  String get classifyId => _classifyId;

  set classifyId(String value) {
    _classifyId = value;
  }

  String get classifyName => _classifyName;

  set classifyName(String value) {
    _classifyName = value;
  }

  String get classifyPicture => _classifyPicture;

  set classifyPicture(String value) {
    _classifyPicture = value;
  }

  List<ProductsBean> get products => _products;

  set products(List<ProductsBean> value) {
    _products = value;
  }


}
