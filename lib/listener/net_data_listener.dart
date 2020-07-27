import 'package:flutter_video_world/net/net_exception.dart';

typedef OnResponseData = Function({Map<String, dynamic> data});

typedef OnResponseError = Function(NetErrorResponse error);

class OnNetResponseListener {
  OnResponseError error;
  OnResponseData data;

  OnNetResponseListener(this.data, this.error);
}
