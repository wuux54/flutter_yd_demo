/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/11/27
 * @E-mail: W_SpongeBob@163.com
 * @Desc：
 */
class ProductsBean {
  /**
   * classify : 1
   * classifyName : 王牌理财限量购
   * createTime : 2019-11-22 15:37:19
   * id : 1
   * isFire : 1
   * isGw : 0
   * isShow : 1
   * isSort : 0
   * ui.page : 1
   * productAtt : 年化收益率
   * productCode : 000912
   * productCount :
   * productDes : 七天优选 每周付息
   * productName : 工资宝
   * productType : 5
   * productUrl : http://www.baidu.com
   * rows : 10
   * sort : 1
   * unit : %
   * updateTime : 2019-11-25 09:57:52
   */

  String _classify;
  String _classifyName;
  String _createTime;
  String _id;
  int _isFire;
  int _isGw;
  int _isShow;
  int _isSort;
  int _page;
  String _productAtt;
  String _productCode;
  String _productCount;
  String _productDes;
  String _productName;
  int _productType;
  String _productUrl;
  int _rows;
  int _sort;
  String _unit;
  String _updateTime;

  ProductsBean();

  ProductsBean.fromJson(Map<String, dynamic> json)
      : _classify = json["classify"],
        _updateTime = json["updateTime"],
        _classifyName = json["classifyName"],
        _createTime = json["createTime"],
        _id = json["id"],
        _isFire = json["isFire"],
        _isGw = json["isGw"],
        _isShow = json["isShow"],
        _isSort = json["isSort"],
        _page = json["ui.page"],
        _productAtt = json["productAtt"],
        _productCode = json["productCode"],
        _productCount = json["productCount"],
        _productDes = json["productDes"],
        _productName = json["productName"],
        _productType = json["productType"],
        _productUrl = json["productUrl"],
        _rows = json["rows"],
        _sort = json["sort"],
        _unit = json["unit"];

  Map<String, dynamic> toJson() {
    var json = new Map<String, dynamic>();
    json["classify"] = _classify;
    json["updateTime"] = _updateTime;
    json["classifyName"] = _classifyName;
    json["createTime"] = _createTime;
    json["id"] = _id;
    json["isFire"] = _isFire;
    json["isGw"] = _isGw;
    json["isShow"] = _isShow;
    json["isSort"] = _isSort;
    json["ui.page"] = _page;
    json["productAtt"] = _productAtt;
    json["productCode"] = _productCode;
    json["productCount"] = _productCount;
    json["productDes"] = _productDes;
    json["productName"] = _productName;
    json["productType"] = _productType;
    json["productUrl"] = _productUrl;
    json["rows"] = _rows;
    json["sort"] = _sort;
    json["unit"] = _unit;
    return json;
  }

  String get classify => _classify;

  set classify(String value) {
    _classify = value;
  }

  String get classifyName => _classifyName;

  set classifyName(String value) {
    _classifyName = value;
  }

  String get createTime => _createTime;

  set createTime(String value) {
    _createTime = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  int get isFire => _isFire;

  set isFire(int value) {
    _isFire = value;
  }

  int get isGw => _isGw;

  set isGw(int value) {
    _isGw = value;
  }

  int get isShow => _isShow;

  set isShow(int value) {
    _isShow = value;
  }

  int get isSort => _isSort;

  set isSort(int value) {
    _isSort = value;
  }

  int get page => _page;

  set page(int value) {
    _page = value;
  }

  String get productAtt => _productAtt;

  set productAtt(String value) {
    _productAtt = value;
  }

  String get productCode => _productCode;

  set productCode(String value) {
    _productCode = value;
  }

  String get productCount => _productCount;

  set productCount(String value) {
    _productCount = value;
  }

  String get productDes => _productDes;

  set productDes(String value) {
    _productDes = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  int get productType => _productType;

  set productType(int value) {
    _productType = value;
  }

  String get productUrl => _productUrl;

  set productUrl(String value) {
    _productUrl = value;
  }

  int get rows => _rows;

  set rows(int value) {
    _rows = value;
  }

  int get sort => _sort;

  set sort(int value) {
    _sort = value;
  }

  String get unit => _unit;

  set unit(String value) {
    _unit = value;
  }

  String get updateTime => _updateTime;

  set updateTime(String value) {
    _updateTime = value;
  }
}
