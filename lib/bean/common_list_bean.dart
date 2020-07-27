import 'package:flutter_video_world/bean/response/products_bean.dart';

/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/11/27
 * @E-mail: W_SpongeBob@163.com
 * @Desc：通用列表Bean类
 */
class CommonListBean {
  /**
   * 服务起返回的数据
   */
  List<ProductsBean> _products;

  ProductsBean _productsBean;

  /**
   * 一期，没有这个字段，自己补充，判断列表数据
   */
  int _specialType;

  /**
   * 本地设置数据
   */
  String _imgUri;
  String _contentName;
  String _contentDesc;
  String _contentTime;

  List<ProductsBean> get products => _products;

  set products(List<ProductsBean> value) {
    _products = value;
  }

  ProductsBean get productsBean => _productsBean;

  set productsBean(ProductsBean value) {
    _productsBean = value;
  }

  int get specialType => _specialType;

  set specialType(int value) {
    _specialType = value;
  }

  String get imgUri => _imgUri;

  set imgUri(String value) {
    _imgUri = value;
  }

  String get contentName => _contentName;

  set contentName(String value) {
    _contentName = value;
  }

  String get contentDesc => _contentDesc;

  set contentDesc(String value) {
    _contentDesc = value;
  }

  String get contentTime => _contentTime;

  set contentTime(String value) {
    _contentTime = value;
  }


}
