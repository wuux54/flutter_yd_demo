abstract class BaseResponse{
  BaseResponse(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}