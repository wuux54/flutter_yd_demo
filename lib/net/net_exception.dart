import 'package:dio/dio.dart';

class NetErrorResponse  {
  int errorCode;
  String errorMsg;

  NetErrorResponse(this.errorCode, this.errorMsg);
}
