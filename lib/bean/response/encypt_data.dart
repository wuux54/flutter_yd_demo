class DataEncrypt {
  String _data;

  DataEncrypt();

  DataEncrypt.fromJson(Map<String, dynamic> json) : _data = json["data"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map["data"] = _data;
    return map;
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }
}
