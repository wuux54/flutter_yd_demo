import 'package:dio/dio.dart';
import 'package:flutter_video_world/net/net_exception.dart';

typedef OnResponse = void Function(Response response);
typedef OnError = void Function(NetErrorResponse e);

class ResponseCallBack {
  OnResponse onResponse;
  OnError onError;

  ResponseCallBack({OnResponse this.onResponse, OnError this.onError});
}
