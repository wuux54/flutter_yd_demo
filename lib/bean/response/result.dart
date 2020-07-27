import 'package:flutter_video_world/constant/net_constant.dart';

/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/7/22
 * @E-mail: W_SpongeBob@163.com
 * @Desc： 外部返回的加密串解密后的真实数组
 */
class HttpResult<T> {
  T _data;
  int _code;
  String _msg;

  HttpResult.fromJson(Map<String, dynamic> json)
      : _data = json["data"],
        _code = json["code"],
        _msg = json["msg"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map["data"] = _data;
    map["code"] = _code;
    map["msg"] = _msg;
    return map;
  }

  T get data => _data;

  set data(T value) {
    _data = value;
  }

  bool isDataSuccess() {
    return _code == NetConstant.CODE_SUCCESS_200;
  }

  bool isSuccess() {
    return _code == NetConstant.CODE_SUCCESS_200;
  }

  int get code => _code;

  set code(int value) {
    _code = value;
  }

  String get msg => _msg;

  set msg(String value) {
    _msg = value;
  }
}
