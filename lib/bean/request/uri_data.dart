/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/11/6
 * @E-mail: W_SpongeBob@163.com
 * @Desc：数据都为 String类型，否则其他转为json会被添写到json串中
 */
class UriTypeBean {
  UriTypeBean();
  /**
   * mobile : 12345678978
   * type : 5 注册type:5 忘记密码type:6
   * verifyCode : 111111
   */

  String _mobile;
  String _type;
  String _verifyCode;

  /**
   * confirmLoginPwd : O3W3EUIIteJVCN4bI9iPzPwR0MSTkwH2gbJqUyXFGPVT5WKuExRyReM6hC3W0AVOz7/dvIuDhh4r1eK5wRUB6OZE4k9/zvy2jD1s/wdGrGUy0fox8vtQO+tK0SxyaWm3DolXbY0JRb5ZDM8dr3GotmPyo0ggX6aMT+o/puUy6XM=
   * loginPassword : GRZfg1eLqehU3nzaVuJcXiPvwfqLEK39un+F/YPvQP73hrn/jOd7f+OJQYKKzMY6jgC00hLngZU8oic7KbHGAOOr/ZxN8oOub84viUcDqwvhkl0vHSgBm0xFkPKF9xGgBl9wfqOrkeU/ORCyy8M1UI3q6ktRA+W+mnsDTYwb1TE=
   * redisHashKey : ydjr:user:rsakey:dswms1571730373638
   * <p>
   * iscName”:”ceshi001”,“provinceId”：“sgcc”
   */

  String _confirmLoginPwd;
  String _loginPassword;
  String _redisHashKey;
  String _iscName;

  /**
   * data : AA
   */

  String _data;

  String _bankName;
  String _bankCardNo;
  String _bankCode;
  String _realName;
  String _idCardNo;

  String _accessToken;

  String _cityNumber;
  String _invoice;

  String _provinceId;
  String _iscLoginDwp;

  String _cusCentMsg;

  String _cardNo;

  /**
   * 主页面列表所需参数
   * pageType 页面标识
   * productType 保险页面列表，tab产品类型标识
   */
  String _pageType;
  String _productType;

  /**
   * 财险产品id
   */
  String _pdId;

  String _cid;

  String get mobile => _mobile;

  set mobile(String value) {
    _mobile = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get verifyCode => _verifyCode;

  set verifyCode(String value) {
    _verifyCode = value;
  }

  String get confirmLoginPwd => _confirmLoginPwd;

  set confirmLoginPwd(String value) {
    _confirmLoginPwd = value;
  }

  String get loginPassword => _loginPassword;

  set loginPassword(String value) {
    _loginPassword = value;
  }

  String get redisHashKey => _redisHashKey;

  set redisHashKey(String value) {
    _redisHashKey = value;
  }

  String get iscName => _iscName;

  set iscName(String value) {
    _iscName = value;
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }

  String get bankName => _bankName;

  set bankName(String value) {
    _bankName = value;
  }

  String get bankCardNo => _bankCardNo;

  set bankCardNo(String value) {
    _bankCardNo = value;
  }

  String get bankCode => _bankCode;

  set bankCode(String value) {
    _bankCode = value;
  }

  String get realName => _realName;

  set realName(String value) {
    _realName = value;
  }

  String get idCardNo => _idCardNo;

  set idCardNo(String value) {
    _idCardNo = value;
  }

  String get accessToken => _accessToken;

  set accessToken(String value) {
    _accessToken = value;
  }

  String get cityNumber => _cityNumber;

  set cityNumber(String value) {
    _cityNumber = value;
  }

  String get invoice => _invoice;

  set invoice(String value) {
    _invoice = value;
  }

  String get provinceId => _provinceId;

  set provinceId(String value) {
    _provinceId = value;
  }

  String get iscLoginDwp => _iscLoginDwp;

  set iscLoginDwp(String value) {
    _iscLoginDwp = value;
  }

  String get cusCentMsg => _cusCentMsg;

  set cusCentMsg(String value) {
    _cusCentMsg = value;
  }

  String get cardNo => _cardNo;

  set cardNo(String value) {
    _cardNo = value;
  }

  String get pageType => _pageType;

  set pageType(String value) {
    _pageType = value;
  }

  String get productType => _productType;

  set productType(String value) {
    _productType = value;
  }

  String get pdId => _pdId;

  set pdId(String value) {
    _pdId = value;
  }

  String get cid => _cid;

  set cid(String value) {
    _cid = value;
  }

  UriTypeBean.fromJson(Map<String, dynamic> json)
      : _data = json["data"],
        _accessToken = json["accessToken"],
        _bankCardNo = json["bankCardNo"],
        _bankCode = json["bankCode"],
        _bankName = json["bankName"],
        _cardNo = json["cardNo"],
        _cid = json["cid"],
        _cityNumber = json["cityNumber"],
        _confirmLoginPwd = json["confirmLoginPwd"],
        _cusCentMsg = json["cusCentMsg"],
        _invoice = json["invoice"],
        _pageType = json["pageType"],
        _productType = json["productType"],
        _mobile = json["mobile"],
        _type = json["type"],
        _verifyCode = json["verifyCode"],
        _loginPassword = json["loginPassword"],
        _redisHashKey = json["redisHashKey"],
        _iscName = json["iscName"],
        _realName = json["realName"],
        _idCardNo = json["idCardNo"],
        _provinceId = json["provinceId"],
        _iscLoginDwp = json["iscLoginDwp"],
        _pdId = json["pdId"];

  Map<String, dynamic> toJson() {
    var json = new Map<String, dynamic>();
    if (_data != null) {
      json["data"] = _data;
    }

    if (_accessToken != null) {
      json["accessToken"] = _accessToken;
    }

    if (_bankCardNo != null) {
      json["bankCardNo"] = _bankCardNo;
    }
    if (_bankCode != null) {
      json["bankCode"] = _bankCode;
    }
    if (_bankName != null) {
      json["bankName"] = _bankName;
    }
    if (_cardNo != null) {
      json["cardNo"] = _cardNo;
    }
    if (_cid != null) {
      json["cid"] = _cid;
    }

    if (_cityNumber != null) {
      json["cityNumber"] = _cityNumber;
    }
    if (_confirmLoginPwd != null) {
      json["confirmLoginPwd"] = _confirmLoginPwd;
    }
    if (_cusCentMsg != null) {
      json["cusCentMsg"] = _cusCentMsg;
    }
    if (_invoice != null) {
      json["invoice"] = _invoice;
    }
    if (_pageType != null) {
      json["pageType"] = _pageType;
    }
    if (_productType != null) {
      json["productType"] = _productType;
    }
    if (_mobile != null) {
      json["mobile"] = _mobile;
    }
    if (_type != null) {
      json["type"] = _type;
    }

    if (_verifyCode != null) {
      json["verifyCode"] = _verifyCode;
    }
    if (_loginPassword != null) {
      json["loginPassword"] = _loginPassword;
    }
    if (_redisHashKey != null) {
      json["redisHashKey"] = _redisHashKey;
    }

    if (_iscName != null) {
      json["iscName"] = _iscName;
    }
    if (_realName != null) {
      json["realName"] = _realName;
    }
    if (_idCardNo != null) {
      json["idCardNo"] = _idCardNo;
    }

    if (_provinceId != null) {
      json["provinceId"] = _provinceId;
    }
    if (_iscLoginDwp != null) {
      json["iscLoginDwp"] = _iscLoginDwp;
    }
    if (_pdId != null) {
      json["pdId"] = _pdId;
    }
    return json;
  }
}
