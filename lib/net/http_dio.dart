import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_video_world/bean/response/net_callback.dart';
import 'package:flutter_video_world/constant/net_constant.dart';
import 'package:flutter_video_world/listener/response_listener.dart';
import 'package:flutter_video_world/net/net_exception.dart';
import 'package:flutter_video_world/utils/utils_net.dart';

class NetClient {
  static Dio _dio;
  static NetClient _netClient;

  NetClient._client() {}

  static NetClient _instance() {
    if (_netClient == null) {
      _netClient = NetClient._client();
    }
    return _netClient;
  }

  static NetClient get getInstance => _instance();

  void _createDio() {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        responseType: ResponseType.plain,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: NetConstant.baseUrl,
      );
      _dio = new Dio(options);
    }
  }

  void requestGet(
    url,
    ResponseCallBack responseCallBack, {
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    assert(url != null);
    assert(responseCallBack != null);

    //判断网络状态
    bool netConnected = await isConnected();
    if (!netConnected) {
      responseCallBack.onError(
          NetErrorResponse(NetConstant.ERROR_NET_NOT, "网络未连接,请检查您的网络"));
      return;
    }

    _createDio();
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } catch (e) {
      responseCallBack.onError(formatDioError(e));
      return;
    }

    switch (response.statusCode) {
      case NetConstant.BAD_REQUEST:
      case NetConstant.UNAUTHORIZED:
      case NetConstant.FORBIDDEN:
      case NetConstant.NOT_FOUND:
      case NetConstant.METHOD_NOT_ALLOWED:
      case NetConstant.REQUEST_TIMEOUT:
      case NetConstant.CONFLICT:
      case NetConstant.PRECONDITION_FAILED:
      case NetConstant.GATEWAY_TIMEOUT:
      case NetConstant.INTERNAL_SERVER_ERROR:
      case NetConstant.BAD_GATEWAY:
      case NetConstant.SERVICE_UNAVAILABLE:
        responseCallBack.onError(NetErrorResponse(
          NetConstant.ERROR_HTTP,
          "网络错误",
        ));
        return;
    }
    responseCallBack.onResponse(response);
  }

  void requestPost(
    url,
    ResponseCallBack responseCallBack, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    assert(url != null);
    assert(responseCallBack != null);

    //判断网络状态
    bool netConnected = await isConnected();
    if (!netConnected) {
      responseCallBack.onError(
          NetErrorResponse(NetConstant.ERROR_NET_NOT, "网络未连接,请检查您的网络"));
      return;
    }

    _createDio();
    Response response;

    try {
      response = await _dio.post(url,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } catch (e) {
      responseCallBack.onError(formatDioError(e));
      return;
    }

    switch (response.statusCode) {
      case NetConstant.BAD_REQUEST:
      case NetConstant.UNAUTHORIZED:
      case NetConstant.FORBIDDEN:
      case NetConstant.NOT_FOUND:
      case NetConstant.METHOD_NOT_ALLOWED:
      case NetConstant.REQUEST_TIMEOUT:
      case NetConstant.CONFLICT:
      case NetConstant.PRECONDITION_FAILED:
      case NetConstant.GATEWAY_TIMEOUT:
      case NetConstant.INTERNAL_SERVER_ERROR:
      case NetConstant.BAD_GATEWAY:
      case NetConstant.SERVICE_UNAVAILABLE:
        responseCallBack.onError(NetErrorResponse(
          NetConstant.ERROR_HTTP,
          "网络错误",
        ));
        return;
    }
    responseCallBack.onResponse(response);
  }

  //无回调监听形式
  Future<NetResponse> requestGetNor(
    url, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    assert(url != null);

    //判断网络状态
    bool netConnected = await isConnected();
    if (!netConnected) {
      return NetResponse(NetConstant.ERROR_NET_NOT, "网络未连接,请检查您的网络");
    }
    _createDio();
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } catch (e) {
      return formatDioError2(e);
    }

    switch (response.statusCode) {
      case NetConstant.BAD_REQUEST:
      case NetConstant.UNAUTHORIZED:
      case NetConstant.FORBIDDEN:
      case NetConstant.NOT_FOUND:
      case NetConstant.METHOD_NOT_ALLOWED:
      case NetConstant.REQUEST_TIMEOUT:
      case NetConstant.CONFLICT:
      case NetConstant.PRECONDITION_FAILED:
      case NetConstant.GATEWAY_TIMEOUT:
      case NetConstant.INTERNAL_SERVER_ERROR:
      case NetConstant.BAD_GATEWAY:
      case NetConstant.SERVICE_UNAVAILABLE:
        return NetResponse(
          NetConstant.ERROR_HTTP,
          "网络错误",
        );
    }

    return NetResponse(200, response.data);
  }

  //无回调监听形式
  Future<NetResponse> requestPostNor(
    url, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    assert(url != null);

    //判断网络状态
    bool netConnected = await isConnected();
    if (!netConnected) {
      return NetResponse(NetConstant.ERROR_NET_NOT, "网络未连接,请检查您的网络");
    }
    _createDio();
    Response response;
    try {
      response = await _dio.post(url,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } catch (e) {
      return formatDioError2(e);
    }

    switch (response.statusCode) {
      case NetConstant.BAD_REQUEST:
      case NetConstant.UNAUTHORIZED:
      case NetConstant.FORBIDDEN:
      case NetConstant.NOT_FOUND:
      case NetConstant.METHOD_NOT_ALLOWED:
      case NetConstant.REQUEST_TIMEOUT:
      case NetConstant.CONFLICT:
      case NetConstant.PRECONDITION_FAILED:
      case NetConstant.GATEWAY_TIMEOUT:
      case NetConstant.INTERNAL_SERVER_ERROR:
      case NetConstant.BAD_GATEWAY:
      case NetConstant.SERVICE_UNAVAILABLE:
        return NetResponse(
          NetConstant.ERROR_HTTP,
          "网络错误",
        );
    }

    return NetResponse(200, response.data);
  }

  /*
   * dio error统一处理
   */
  NetErrorResponse formatDioError(Exception e) {
    int errorCode;
    String errorMsg;
    if (e is DioError) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorCode = NetConstant.ERROR_CONNECTION_TIMEOUT;
        errorMsg = "服务器响应超时";
      } else if (e.type == DioErrorType.SEND_TIMEOUT) {
        errorCode = NetConstant.ERROR_CONNECTION_TIMEOUT;
        errorMsg = "请求超时，请检查您的网络";
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorCode = NetConstant.ERROR_CONNECTION_TIMEOUT;
        errorMsg = "服务器响应超时";
      } else if (e.type == DioErrorType.RESPONSE) {
        // When the server response, but with a incorrect status, such as 404, 503...
        errorCode = NetConstant.NOT_FOUND;
        errorMsg = "响应异常404";
      } else if (e.type == DioErrorType.CANCEL) {
        errorCode = NetConstant.CONNECT_CANCEL;
        errorMsg = "请求取消";
      } else {
        errorCode = NetConstant.ERROR_NO;
        errorMsg = "未知错误";
      }
    } else {
      //均视为解析错误
      errorCode = NetConstant.ERROR_PARSE;
      errorMsg = "数据解析错误";
    }

    return NetErrorResponse(
      errorCode,
      errorMsg,
    );
  }

  /*
   * dio error统一处理
   */
  NetResponse formatDioError2(Exception e) {
    int errorCode;
    String errorMsg;
    if (e is DioError) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorCode = NetConstant.ERROR_CONNECTION_TIMEOUT;
        errorMsg = "服务器响应超时";
      } else if (e.type == DioErrorType.SEND_TIMEOUT) {
        errorCode = NetConstant.ERROR_CONNECTION_TIMEOUT;
        errorMsg = "请求超时，请检查您的网络";
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorCode = NetConstant.ERROR_CONNECTION_TIMEOUT;
        errorMsg = "服务器响应超时";
      } else if (e.type == DioErrorType.RESPONSE) {
        // When the server response, but with a incorrect status, such as 404, 503...
        errorCode = NetConstant.NOT_FOUND;
        errorMsg = "响应异常404";
      } else if (e.type == DioErrorType.CANCEL) {
        errorCode = NetConstant.CONNECT_CANCEL;
        errorMsg = "请求取消";
      } else {
        errorCode = NetConstant.ERROR_NO;
        errorMsg = "未知错误";
      }
    } else {
      //均视为解析错误
      errorCode = NetConstant.ERROR_PARSE;
      errorMsg = "数据解析错误";
    }

    return NetResponse(
      errorCode,
      errorMsg,
    );
  }
}
