class ImgConstantData {
  /*-------------------------------images---------------------------------------*/
  static const String ASSETS_IMG = "assets/images/";

  static const String IMG_ICON_HOME_SELECT =
      ASSETS_IMG + "home_tab_icon_selected.png";
  static const String IMG_ICON_HOME =
      ASSETS_IMG + "home_tab_icon_unselected.png";

  static const String IMG_ICON_FINANCIAL_SELECT =
      ASSETS_IMG + "financial_tab_icon_selected.png";
  static const String IMG_ICON_FINANCIAL =
      ASSETS_IMG + "financial_tab_icon_unselected.png";

  static const String IMG_ICON_INSURANCE_SELECT =
      ASSETS_IMG + "insurance_tab_icon_selected.png";
  static const String IMG_ICON_INSURANCE =
      ASSETS_IMG + "insurance_tab_icon_unselected.png";

  static const String IMG_ICON_SERVICE_SELECT =
      ASSETS_IMG + "service_tab_icon_selected.png";
  static const String IMG_ICON_SERVICE =
      ASSETS_IMG + "service_tab_icon_unselected.png";

  static const String IMG_ICON_MY_SELECT =
      ASSETS_IMG + "my_tab_icon_selected.png";
  static const String IMG_ICON_MY = ASSETS_IMG + "my_tab_icon_unselected.png";

  static const String IMG_SPLASH = ASSETS_IMG + "splash.gif";
  static const String IMG_BG_SPLASH = ASSETS_IMG + "bg_splash.png";
  static const String IMG_ICON_MAIN = ASSETS_IMG + "icon_expand_pause.png";
  static const String IMG_ICON_MAIN_SELECT =
      ASSETS_IMG + "icon_expand_play.png";
  static const String IMG_DEF_6 = ASSETS_IMG + "image_6.png";

  static const String IMG_BG_HOME_RED = ASSETS_IMG + "home_bg_red.png";
  static const String IMG_BG_HOME_BANNER =
      ASSETS_IMG + "home_def_bannerydjr.png";

  static const String IMG_ICON_HOME_FUND = ASSETS_IMG + "home_icon_fund.png";
  static const String IMG_ICON_HOME_SECURITIES =
      ASSETS_IMG + "home_icon_securities.png";
  static const String IMG_ICON_HOME_NOTICE =
      ASSETS_IMG + "home_icon_notice.png";
  static const String IMG_ICON_HOME_CUSTOMER_SERVICE =
      ASSETS_IMG + "home_icon_customer_service.png";

  static const String IMG_HOME_BG_GIFT = ASSETS_IMG + "home_bg_gift.png";
  static const String IMG_HOME_BG_SIGN = ASSETS_IMG + "home_bg_sign.png";

  static const String IMG_HOME_ADS_AN_HUI =
      ASSETS_IMG + "home_def_bannersyyy.png";

  static const String IMG_ICON_ARROW_RIGHT = ASSETS_IMG + "arrow_right.png";

  static const String IMG_HOME_FINANCIAL1 = ASSETS_IMG + "financial1.png";

  static const String IMG_HOME_FINANCIAL2 = ASSETS_IMG + "financial2.png";

  static const String IMG_HOME_FINANCIAL3 = ASSETS_IMG + "financial3.png";

  static const String IMG_FINANCIAL_DEF_RECOM =
      ASSETS_IMG + "financial_def_recom.png";

  static const String IMG_FINANCIAL_CARD_BG = ASSETS_IMG + "financial_bg.png";

  static const String IMG_FINANCIAL_CARD_EYE_OP =
      ASSETS_IMG + "financial_icon_eye_op.png";
  static const String IMG_FINANCIAL_CARD_EYE_CLOSE =
      ASSETS_IMG + "financial_icon_eye_close.png";

  static const String IMG_ICON_ARROW_RIGHT_WHITE = ASSETS_IMG + "arrow2.png";

  static const String IMG_FINANCIAL_ICON_BILL =
      ASSETS_IMG + "financial_icon_bill.png";
  static const String IMG_FINANCIAL_ICON_TRANSACTION =
      ASSETS_IMG + "financial_icon_transaction.png";


  static const String IMG_INSURANCE_CARD_BG = ASSETS_IMG + "insurance_bg.png";
  static const String IMG_SECURITY_CARD_BG = ASSETS_IMG + "security_bg.png";
  static const String IMG_SERVE_ICON_S = ASSETS_IMG + "serve_icon_s.png";

  static const String IMG_SERVE_ICON_GIFT = ASSETS_IMG + "serve_icon_gift.png";
  static const String IMG_MY_BG_ME = ASSETS_IMG + "my_bg_me.png";

  static const String IMG_MY_ICON_FINA = ASSETS_IMG + "my_icon_fina.png";

  static const String IMG_MY_DEF_HEAD = ASSETS_IMG + "my_def_head.png";

  static const String IMG_MY_ICON_MONEY = ASSETS_IMG + "my_icon_money.png";

  static const String IMG_MY_ICON_SET = ASSETS_IMG + "my_icon_set.png";

  static const String IMG_ICON_ARROW_LEFT = ASSETS_IMG + "icon_arrow_left.png";

}

class SizeConstant {
  static const double allBorderMargin = 20;
}

class ColorConstant {
  static const int black444444 = 0xFF444444;
  static const int black333333 = 0xFF333333;
  static const int blackBCC1C9 = 0xFFBCC1C9;
  static const int grey898A96 = 0xFF898A96;
  static const int grey999999 = 0xFF999999;
  static const int brownDCCABB = 0xFFDCCABB;
  static const int brownB69A85 = 0xFFB69A85;
  static const int brownB2957C = 0xFFB2957C;
  static const int redFF584B = 0xFFFF584B;
  static const int redFF6458 = 0xFFFF6458;
  static const int redFF7B26 = 0xFFFF7B26;
  static const int blue5788FF = 0xFF5788FF;
  static const int whiteEEEEEE = 0xFFEEEEEE;
  static const int whiteFFFEFF = 0xFFFFFEFF;
  static const int whiteF4F6FB = 0xFFF4F6FB;
  static const int green076D4B = 0xFF076D4B;
  static const int green107D5D= 0xFF107D5D;
  static const int green54BB88= 0xFF54BB88;
  static const int green43B47C= 0xFF43B47C;

  static const int yellowFFF07D= 0xFFFFF07D;
  static const int yellowFFD743  = 0xFFFFD743;


  static const int bgNor = 0xFFFFFFFF;
}

class TypeConstant {
  /**
   * 1.工资宝类型横向列表  此类型条目count 为1
   * 2.text text 有底部标签     首页 人气热销好保障
   * 3.img 条目类型      首页 资讯类型
   * 4.btn 条目类型     首页  理赔类型
   * 5.e付宝 text 有推荐标签 条目类型    理财  为你精选
   * 6.保险页  text 没有推荐标签的    保险   出行  为您推荐
   * 7.保险页 健康页面大卡片类型 此类型条目count 为1   保险 健康金
   * 8.每页末尾提示文本类型   首页  末尾提示
   * 9.广告图片类型
   * 100.  TYPE_COMMON_LIST_TITLE  标题类型
   */
  static const int TYPE_COMMON_LIST_1 = 1;
  static const int TYPE_COMMON_LIST_2 = 2;
  static const int TYPE_COMMON_LIST_3 = 3;
  static const int TYPE_COMMON_LIST_4 = 4;
  static const int TYPE_COMMON_LIST_5 = 5;
  static const int TYPE_COMMON_LIST_6 = 6;
  static const int TYPE_COMMON_LIST_7 = 7;
  static const int TYPE_COMMON_LIST_FOOTER_8 = 8;
  static const int TYPE_COMMON_LIST_ADS_9 = 9;
  static const int TYPE_COMMON_LIST_TITLE = 100;

/*
     * ------------------------------  网络数据常量 -------------------------------------
     */

}
