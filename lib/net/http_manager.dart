import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_video_world/bean/request/nor_request.dart';
import 'package:flutter_video_world/bean/response/encypt_data.dart';
import 'package:flutter_video_world/bean/response/result.dart';
import 'package:flutter_video_world/constant/net_constant.dart';
import 'package:flutter_video_world/listener/net_data_listener.dart';
import 'package:flutter_video_world/listener/response_listener.dart';
import 'package:flutter_video_world/net/http_dio.dart';
import 'package:flutter_video_world/net/net_exception.dart';
import 'package:flutter_video_world/utils/utils_aes_key.dart';
import 'package:flutter_video_world/utils/utils_encrypt.dart';

class NetManager {
  static NetManager _netManager;

  NetManager._net();

  //工厂构造函数。方法或参数返回没有变化时使用这个关键字。类似保证单例
//  factory NetManager() => _instance();

  static NetManager _instance() {
    if (_netManager == null) {
      _netManager = new NetManager._net();
    }
    return _netManager;
  }

  static NetManager get getInstance => _instance();

  /*
   * 服务器返回code error统一处理
   */
  NetErrorResponse formatResultError(HttpResult httpResult) {
    int errorCode;
    String errorMsg;
    switch (httpResult.code) {
      case NetConstant.CODE_ERROR_TOKEN_INVALID_200013:
      case NetConstant.CODE_ERROR_TOKEN_NULL_OR_INVALID_200020:
      case NetConstant.CODE_ERROR_TOKEN_NULL_200014:
        errorCode = NetConstant.ERROR_TOKEN_INVALID;
        errorMsg = "用户认证过期";
        break;
      default:
        errorCode = httpResult.code;
        errorMsg = httpResult.msg;
        break;
    }
    return NetErrorResponse(httpResult.code, httpResult.msg ?? "");
  }

  /*
   *  通用接口获取，返回都是DataEncrypt类型
   *  接口通用要求返回格式：{"data":"AES加密{"msg":"","data":"具体数据json","code":""}"}。
   */
  CancelToken requestCommonData(
      NormalRequest normalRequest, OnNetResponseListener netResponseListener) {
    assert(normalRequest != null);
    assert(netResponseListener != null);

    var cancelToken = CancelToken();
    var data = DataEncrypt();
    data.data = EncryptHelper.encodeAes(
        json.encode(normalRequest.toJson()), EncryptAesKey.aesK);
    NetClient.getInstance.requestPost(
      "wwjc/appControl/execAppPost/",
      ResponseCallBack(onResponse: (response) {
        try {
          HttpResult httpResult = _getHttpResult(response);
          //code码：非200，回调失败处理。200：成功
          if (httpResult.isSuccess()) {
            netResponseListener.data(data: httpResult.data ?? "");
          } else {
            netResponseListener.error(formatResultError(httpResult));
          }
        } catch (e) {
          netResponseListener
              .error(NetErrorResponse(NetConstant.ERROR_PARSE, "数据解析错误"));
        }
      }, onError: (e) {
        netResponseListener.error(e);
      }),
      cancelToken: cancelToken,
      data: json.encode(data.toJson()),
    );
    return cancelToken;
  }

  HttpResult _getHttpResult(Response response) {
    var data = response.data;
    //解析数据
    Map<String, dynamic> map = json.decode(data);
    DataEncrypt dataEncrypt = DataEncrypt.fromJson(map);

    //解密数据
    var decodeAes =
        EncryptHelper.decodeAes(dataEncrypt?.data, EncryptAesKey.aesK);
    //判断code码
    Map<String, dynamic> norData = json.decode(decodeAes);
    HttpResult httpResult = HttpResult.fromJson(norData);
    return httpResult;
  }
}
