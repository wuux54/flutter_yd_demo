class NetConstant {
  static const String HTTP = "http://";
  static const String HTTPS = "https://";

  static const String GET = "GET";
  static const String POST = "POST";

  static const String baseUrl = HTTP + "192.168.1.100:18302" + "/";

/*----------------------------------------url---------------------------------------------*/
  /*
     * 获取用户rsa公钥
     */

  static const String URI_RSA_PUBLIC_KEY = "/user-api/appUserInfo/getRSAPublicKey";

  /*
     * 获取支付密码rsa公钥
     */

  static const String URI_RSA_PAY_PWD_PUBLIC_KEY = "/pay-api/v1/payDwpInfo/getRSAPublicKey";


  /*
     * 校验手机注册号是否注册
     */

  static const String URI_REGISTER_MOBILE_CHECK = "/user-api/userInfo/userIsExistByMobileWithSociety";

  /*
     * 忘记密码->校验手机注册号是否注册
     */

  static const String URI_REGISTER_MOBILE_CHECK_FORGET = "/user-api/userInfo/forgetUserIsExistByMobile";

  /*
     * 请求获取验证码
     */

  static const String URI_REGISTER_REQUEST_SMS_CODE = "/msg-api/ydjrAppSms/registUserVerifyCode";

  /*
     * 忘记密码->请求获取验证码
     */

  static const String URI_REGISTER_REQUEST_SMS_CODE_FORGET = "/msg-api/ydjrAppSms/forgetDwpVerifyCode";
  /*
     * 发送验证码
     */
  static const String URI_REGISTER_SEND_SMS_CODE_FORGET = "/msg-api/sendSms/verifySmsCode";
  static const String URI_REGISTER_SEND_SMS_CODE = "/user-api/appUserInfo/checkRegisterUserType";

  /*
     * 提交注册
     */

  static const String URI_REGISTER = "/user-api/appUserInfo/register";

  /*
     * 忘记密码->提交注册
     */

  static const String URI_REGISTER_FORGET = "/user-api/loginDwpInfo/forgetLoginPwd";


  /**
   * 提交手机号登陆
   */

  static const String URI_LOGIN_PHONE = "/user-api/login/ydjrLoginByPhone";
  /**
   * 提交ISC登陆
   */

  static const String URI_LOGIN_ISC = "/user-api/login/ydjrAppLogin";

  /**
   * 获取所有展示的bank列表
   */

  static const String URI_BANK_ALL_LIST = "/user-api/bankCode/getAllBankCodeList";

  /**
   * 认证用户身份证
   */

  static const String URI_USER_ID_CARD = "/user-api/userInfo/authenticationByIdCardNo";

  /**
   * 获取用户身份证号、平台常用手机号
   */

//    static const String URI_USER_ID_CARD_MOBILE = "/fund-api/fund/getIdCardAndMobile";

  /**
   * 找回交易密码发送短信验证码
   */
  static const String URI_USER_PAY_VERIFY_CODE = "/msg-api/paySms/resetPayPasswordVerifyCode";

  /**
   * 找回交易密码校验短信验证码
   */

  static const String URI_USER_PAY_VERIFY_CODE_CHECK = "/pay-api/v1/payDwpInfo/checkPayPasswordCode";


  /**
   * 维护银行卡信息
   */

  static const String URI_USER_BANK_INFO_ADD = "/user-api/bankCard/insertOrUpdateBankCardForAPP";

  /**
   * 获取"我的"银行卡信息
   */
  static const String URI_USER_BANK_MY = "/user-api/bankCard/getMyBankCardInfo";

  /**
   * 银行卡认证
   */

  static const String URI_BANK_INFO_LIMIT = "/fund-api/fund/getUserMaxLimit";


  /**
   * 基金开户，验证码校验
   */

  static const String URI_FUND_OPEN_SMS_CHECK = "/fund-api/fund/fundOpen";

  /**
   * 获取用户状态信息
   */
//    static const String URI_USER_STATUS_INFO = "/fund-api/fund/getIsFundOpenAccount";
  static const String URI_USER_STATUS_INFO = "/user-api/userInfo/getUserStatusForAPP";

  /**
   * 设置支付密码
   */
  static const String URI_PAY_PWD_SET = "/pay-api/v1/payDwpInfo/setUserPayPwd";
  /**
   * 修改支付密码
   */

  static const String URI_PAY_PWD_UPD = "/pay-api/v1/payDwpInfo/resetPayPwd";
  /**
   * 校验支付密码
   */
  static const String URI_PAY_PWD_CHECK = "/pay-api/v1/payDwpInfo/checkDwp";

  /**
   * 支付理赔获取医院列表
   */
  static const String URI_CLAIM_HOSPITAL_LIST = "/claim-api/appClaim/getHosptialList";

  /**
   * 在线理赔申请，获取公司和姓名
   */

  static const String URI_CLAIM_APPLY_INFO = "/claim-api/appClaim/applyForClaim";

  /**
   * 在线理赔保存信息
   */

  static const String URI_CLAIM_SAVE = "/claim-api/appClaim/saveClaim";
  /**
   * 查看发票号是否已存在
   */
  static const String URI_CLAIM_INVOICE_EXIST = "/claim-api/appClaim/isExistInvoice";

  /**
   * 查看用户是否在理赔白名单内
   */
  static const String URI_CLAIM_WHITE_CHECK = "/claim-api/appClaim/getWhiteClaim";

  /**
   * 上传文件或图片
   */
//    static const String URI_UPLOAD_FILE = "/wwjc/control/appUploadFile";
//    static const String URI_UPLOAD_FILE = "/wwjc/control/uploadFileForAndroid";
  static const String URI_UPLOAD_FILE = "/wwdfs-api/image/uploadFile";
//    http://192.168.1.101:18302/wwjc/control/appUploadFile

  /**
   * 获取可展示文件或图片
   * http://127.0.0.1:18081/wwjc/control/getFile
   */
  static const String URI_GET_IMG_FILE = "/wwdfs-api/imageDownload/downloadFile";// "/wwjc/control/getFileApp";

  static const String URI_CLAIM_SUBMIT = "/claim-api/appClaim/commitPdfClaim";

  /**
   * ISC登陆时认证
   */
  static const String URI_REGISTER_ISC_CONFIRM = "/user-api/userTsiger/tsigreAuthent";

  /**
   * ISC登陆后的认证
   */
  static const String URI_ISC_CONFIRM = "/user-api/userAuthent/loginAuthentSave";

  /**
   * ISC 绑定->手机号
   */

  static const String URI_ISC_BIND_MOBILE = "/user-api/appUserInfo/bindMobile";

  /**
   * ISC 绑定->获取短信验证码
   */

  static const String URI_ISC_BIND_SMS_REQUEST = "/msg-api/ydjrAppSms/bindMobileVerifyCode";

  /**
   * ISC 绑定->提交短信验证码
   */

//    static const String URI_ISC_BIND_SMS_CHECK = "/msg-api/sendSms/verifySmsCode";
  static const String URI_ISC_BIND_SMS_CHECK = "/user-api/appUserInfo/bindMobileCommitVerCode";

  /**
   * ISC 绑定->设置手机号码登陆的登陆密码
   */

  static const String URI_ISC_BIND_LOGIN_PWD = "/user-api/appUserInfo/setDwpWithMobile";

  /**
   * ISC 绑定->设置手机号码登陆的登陆密码
   */

  static const String URI_CUSTOM_TXT = "/comm-api/customCenter/savecustomInfo";


  /**
   * 理财页面个人基金数据查询
   */

  static const String URI_FUND_MY = "/fund-api/fund/getMyFundVolApp";

  /**
   * 主页面列表集合类
   */

  static const String URI_COMMON_LIST = "/comm-api/homePage/getCommProduct";

  /**
   * 登陆用户信息
   */

  static const String URI_LOGIN_USER_INFO = "/user-api/userInfo/getLoginUserInfo";

  /**
   * 获取财险产品数据，拼接到url上
   */
  static const String URI_CAI_XIAN_DATA = "/user-api/userDock/getParamData";
  /**
   * 退出登陆
   */

  static const String URI_LOGIN_EXIT = "/user-api/logout/ydAppLogout";

  /**
   * 根据cid用户理赔信息
   */
  static const String URI_CLAIM_GET_BY_CID = "/claim-api/appClaim/getClaimById";

  /**
   * 银行卡卡号和银行名称校验接口
   */
  static const String URI_BANK_CODE_CHECK = "/user-api/bankCard/matchBankCardAndBankCode";

  /**
   * 图形验证码
   */
  static const String URI_LOGIN_IMG_CODE = "/user-api/appUserInfo/getImgVerCode";
/*----------------------------------------数据格式---------------------------------------------*/
  static const String RESPONSE_USER_TYPE_WW = "ww";

  static const String RESPONSE_USER_TYPE_ISC = "isc";

  /**
   * nextStatus_1((byte)1, "电话号码为空"),
   * nextStatus_3((byte)3, "电话不为空，密码为空"),
   * nextStatus_5((byte)5, "电话密码都不为空");
   */
  static const String RESPONSE_USER_TYPE_ISC_STATUS_1 = "nextStatus_1";
  static const String RESPONSE_USER_TYPE_ISC_STATUS_3 = "nextStatus_3";
  static const String RESPONSE_USER_TYPE_ISC_STATUS_5 = "nextStatus_5";

  /**
   * 判断推荐或特殊标签是否显示0不展示，1展示
   */
  static const int FIRE_TYPE_0 = 0;
  static const int FIRE_TYPE_1 = 1;

  /**
   * 判断标题类型条目是否显示 0不展示，1展示
   */
  static const int ITEM_TITLE_TYPE_0 = 0;
  static const int ITEM_TITLE_TYPE_1 = 1;

  /**
   * FIRE：推荐
   * CHILD:为孩子
   * MORE:更多
   * ELE:家电
   */
  static const String IMG_TITLE_ICON_FIRE = "FIRE";
  static const String IMG_TITLE_ICON_CHILD = "CHILD";
  static const String IMG_TITLE_ICON_MORE = "MORE";
  static const String IMG_TITLE_ICON_ELE = "ELE";

  /**
   * 基金状态(1.待开户;2.已开户;3.待风险测评;4.完成风险测评;)
   */
  static const int FUND_OPEN_STATUS_1 = 1;
  static const int FUND_OPEN_STATUS_2 = 2;
  static const int FUND_OPEN_STATUS_3 = 3;
  static const int FUND_OPEN_STATUS_4 = 4;

  /**
   * 原生跳转地址规定
   * PAGE_CLAIM_ONLINE : 在线理赔
   */
  static const String JUMP_TO_LOCAL_PAGE_CLAIM_ONLINE = "PAGE_CLAIM_ONLINE";

  static const String WEB_URL_IDENTIFY = "/#ydapp";

  //增值宝code码
  static const String WEB_CODE_FUND_OTHER = "650002";

  //百万安惠code码
  static const String WEB_CODE_BAIWANANHUI = "6";

  static const String TYPE_STRING_TRUE = "true";
  static const String TYPE_STRING_FALSE = "false";

  //住院，急诊，医药
  static const String TYPE_CLAIM_HOSPITAL_0 = "0";
  static const String TYPE_CLAIM_HOSPITAL_1 = "1";
  static const String TYPE_CLAIM_HOSPITAL_2 = "2";

  static const String HEADER_SYSTEM_ID = "ZYAPP2020";
  static const String HEADER_USER_AGENT = "ANDROID";
  static const String HEADER_IMG_BASE64 = "undefined";

  /**
   * 主页列表pageType所需参数
   * 1 首页 2 保险 3 理财 4 服务
   */
  static const String TYPE_PAGE_HOME_1 = "1";
  static const String TYPE_PAGE_INSURANCE_2 = "2";
  static const String TYPE_PAGE_FINANCIAL_3 = "3";
  static const String TYPE_PAGE_SERVICE_4 = "4";

  /**
   * 主页列表productType所需参数
   * 保险页面必传 1健康 2出行 3意外 4 财产
   */
  static const String TYPE_PRODUCT_HEALTH_1 = "1";
  static const String TYPE_PRODUCT_TRAVEL_2 = "2";
  static const String TYPE_PRODUCT_ACCIDENTS_3 = "3";
  static const String TYPE_PRODUCT_PROPERTY_4 = "4";

  /**
   * 1.3.4验证验证码(4:找回交易密码 注册type:5 忘记密码type:6 ISC绑定手机号：7)
   */
  static const String TYPE_SMS_CODE_4 = "4";
  static const String TYPE_SMS_CODE_5 = "5";
  static const String TYPE_SMS_CODE_6 = "6";
  static const String TYPE_SMS_CODE_7 = "7";

  static const String TYPE_BANK_SPDB = "SPDB"; //  浦发
  static const String TYPE_BANK_GDB = "GDB"; //  广发
  static const String TYPE_BANK_ICBC = "ICBC"; // 中国工商银行
  static const String TYPE_BANK_CCB = "CCB"; //  中国建设银行
  static const String TYPE_BANK_CIB = "CIB"; //  兴业银行

  static const String CLAIM_RESPONSE_0 = "0";
  static const String CLAIM_RESPONSE_1 = "1";
  static const String CLAIM_RESPONSE_2 = "2";

  static const String CHANNEL_TYPE = "103";

  static const String WEB_JUMP_TYPE_0 = "0"; // 理财首页
  static const String WEB_JUMP_TYPE_1 = "1"; // 开户页
  static const String WEB_JUMP_TYPE_2 = "2"; // 保险首页
  static const String WEB_JUMP_TYPE_3 = "3"; // 在线理赔
  static const String WEB_JUMP_TYPE_4 = "4"; // 登陆页面
  static const String WEB_JUMP_TYPE_5 = "5"; // 设置交易密码页面
  static const String WEB_JUMP_TYPE_6 = "6"; // 找回交易密码页面
  static const String WEB_JUMP_TYPE_7 = "7"; // 修改在线理赔
  static const String WEB_JUMP_TYPE_8 = "8"; // 首页
  /*-------------------------------------网络返回对应-----------------------------------------*/
  static const int CODE_SUCCESS_200 = 200;
  static const int CODE_ERROR_200 = -200;
  static const int CODE_ERROR_REGISTER_EXIST = 200004;

  // 手机号已经注册过
  static const int CODE_ERROR_REGISTER_EXIST_200037 = 200037;

  // 手机号已经绑定在别的号上
  static const int CODE_ERROR_REGISTER_IPHONE_BIND_200038 = 200038;

  /**
   * ("200014", "请求参数异常,token不能为空", ""),
   * ("200020", "退出操作失败,token为空或无效", ""),
   * ("200013", "用户会话已过期", "用户需重新登录"),
   */
  static const int CODE_ERROR_TOKEN_INVALID_200013 = 200013;
  static const int CODE_ERROR_TOKEN_NULL_OR_INVALID_200020 = 200020;
  static const int CODE_ERROR_TOKEN_NULL_200014 = 200014;

  static const int ERROR_PARSE = 0x501;
  static const int ERROR_CONNECTION_NOT = 0x502;
  static const int ERROR_NET_NOT = 0x503;
  static const int ERROR_CONNECTION_TIMEOUT = 0x504;
  static const int ERROR_NO = 0x505;
  static const int ERROR_HTTP = 0x506;
  static const int ERROR_TOKEN_INVALID = 0x507;
  static const int ERROR_HOST_UNKNOWN = 0x508;
  static const int CONNECT_CANCEL = 0x509;

  /**
   * 对应HTTP的状态码
   */
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int METHOD_NOT_ALLOWED = 405;
  static const int REQUEST_TIMEOUT = 408;
  static const int CONFLICT = 409;
  static const int PRECONDITION_FAILED = 412;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;
}
