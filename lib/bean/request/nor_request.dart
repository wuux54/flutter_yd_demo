/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/7/23
 * @E-mail: W_SpongeBob@163.com
 * @Desc： 登陆注册模块通用请求类
 */
class NormalRequest {
  /**
   * reqType : GET
   * uriData : {}
   * targetURI : /user-api/ydjrUserInfo/getRSAKey
   * accessToken :
   */

  String _reqType;
  String _uriData;
  String _targetURI;
  String _accessToken;
  String _deviceId;
  String _timeStamp;

  String get reqType => _reqType;

  set reqType(String value) {
    _reqType = value;
  }

  String get uriData => _uriData;

  set uriData(String value) {
    _uriData = value;
  }

  String get targetURI => _targetURI;

  set targetURI(String value) {
    _targetURI = value;
  }

  String get accessToken => _accessToken;

  set accessToken(String value) {
    _accessToken = value;
  }

  String get deviceId => _deviceId;

  set deviceId(String value) {
    _deviceId = value;
  }

  String get timeStamp => _timeStamp;

  set timeStamp(String value) {
    _timeStamp = value;
  }
  NormalRequest();

  NormalRequest.fromJson(Map<String, dynamic> json)
      : _accessToken = json["accessToken"],
        _deviceId = json["deviceId"],
        _reqType = json["reqType"],
        _targetURI = json["targetURI"],
        _timeStamp = json["timeStamp"],
        _uriData = json["uriData"];

  Map<String, dynamic> toJson() {
    var json = new Map<String, dynamic>();
    json["accessToken"] = _accessToken;
    json["deviceId"] = _deviceId;
    json["reqType"] = _reqType;
    json["targetURI"] = _targetURI;
    json["timeStamp"] = _timeStamp;
    json["uriData"] = _uriData;
    return json;
  }
}
