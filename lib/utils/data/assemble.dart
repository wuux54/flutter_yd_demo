import 'package:flutter_video_world/bean/common_list_bean.dart';
import 'package:flutter_video_world/bean/response/common_list.dart';
import 'package:flutter_video_world/bean/response/products_bean.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/constant/net_constant.dart';

/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/8/19
 * @E-mail: W_SpongeBob@163.com
 * @Desc：数据组装工具类
 */
class DataAssembleUtils {
  static List<CommonListBean> createCommonList(CommonListResponse mData) {
    List<CommonListBean> objectList = new List();
    if (mData == null) {
      return objectList;
    }
    List<ListBean> list = mData.list;

    if (list == null || list.length == 0) {
      return objectList;
    }

    for (int i = 0; i < list.length; i++) {
      ListBean listBean = list[i];

      CommonListBean titleBean = new CommonListBean();
      titleBean.contentName = listBean.classifyName;
      titleBean.imgUri = listBean.classifyPicture;
      titleBean.specialType = TypeConstant.TYPE_COMMON_LIST_TITLE;
      int specialType = listBean.classifyUiType;

      if (NetConstant.ITEM_TITLE_TYPE_1 == listBean.isShow) {
        objectList.add(titleBean);
      }

      if (TypeConstant.TYPE_COMMON_LIST_1 == (specialType) ||
          TypeConstant.TYPE_COMMON_LIST_7 == (specialType)) {
        CommonListBean contentListBean = new CommonListBean();
        contentListBean.specialType = specialType;
        contentListBean.products = listBean.products;
        objectList.add(contentListBean);
      } else {
        if (listBean.products != null) {
          for (var product in listBean.products) {
            CommonListBean contentBean = new CommonListBean();
            contentBean.specialType = specialType;
            contentBean.productsBean = product;
            objectList.add(contentBean);
          }
        }
      }
    }
    return objectList;
  }

  static CommonListBean getType2Item() {
    var bean2 = CommonListBean();
    bean2.specialType = TypeConstant.TYPE_COMMON_LIST_2;
    bean2.contentName = "人气热销好保障";
    var productsBean = new ProductsBean();
    productsBean.productDes = "百万保障 安心惠享";
    productsBean.productName = "康佑倍至";
    productsBean.productAtt = "医疗险";
    productsBean.unit = "元起";
    productsBean.productCount = "100";
    bean2.productsBean = productsBean;
    return bean2;
  }

  static CommonListBean getType3Item() {
    var bean2 = CommonListBean();
    bean2.specialType = TypeConstant.TYPE_COMMON_LIST_3;
    bean2.contentName = "前十月债基发行数量创历史新高 爆款频现";
    bean2.contentDesc = "329阅读";
    bean2.imgUri = ImgConstantData.IMG_HOME_FINANCIAL1;
    bean2.contentTime = "2019-01-20";
    return bean2;
  }

  static CommonListBean getType4Item() {
    var bean2 = CommonListBean();
    bean2.specialType = TypeConstant.TYPE_COMMON_LIST_4;
    var productsBean = new ProductsBean();
    productsBean.productDes = "医疗费用 在线报销";
    productsBean.productName = "在线理赔";
    productsBean.productAtt = "让数据多跑路 让员工少跑路";
    bean2.productsBean = productsBean;
    return bean2;
  }

  static CommonListBean getTitleItem(String name) {
    var bean1 = CommonListBean();
    bean1.specialType = TypeConstant.TYPE_COMMON_LIST_TITLE;
    bean1.contentName = name;
    return bean1;
  }

  static CommonListBean getType9Item() {
    var bean = CommonListBean();
    bean.imgUri = ImgConstantData.IMG_HOME_ADS_AN_HUI;
    bean.specialType = TypeConstant.TYPE_COMMON_LIST_ADS_9;
    return bean;
  }

  static CommonListBean getType1Item() {
    var bean2 = CommonListBean();
    bean2.specialType = TypeConstant.TYPE_COMMON_LIST_1;
    bean2.contentName = "人气热销好保障";

    List<ProductsBean> list = [
      new ProductsBean(),
      new ProductsBean(),
      new ProductsBean()
    ];
    for (ProductsBean productsBean in list) {
      productsBean.productDes = "放心使用 最低折扣";
      productsBean.productName = "工资宝";
      productsBean.productAtt = "本月最高优惠";
      productsBean.unit = "%";
      productsBean.productCount = "97";
    }
    bean2.products = list;
    return bean2;
  }



  static CommonListBean getType5Item() {
    var bean2 = CommonListBean();
    bean2.specialType = TypeConstant.TYPE_COMMON_LIST_5;
    bean2.contentName = "为您精选";
    var productsBean = new ProductsBean();
    productsBean.isFire = 1;
    productsBean.productAtt = "千元起投 在线出单";
    productsBean.productName = "e富宝";
    productsBean.productDes = "预期结算收益";
    productsBean.unit = "%";
    productsBean.productCount = "5.0";
    bean2.productsBean = productsBean;
    return bean2;
  }
}
