/**
 * 代码是最为耐心、最能忍耐和最令人愉快的伙伴，
 * 在任何艰难困苦的时刻它都不会离你而去。 --PeiQi_Pig
 *
 * @Author: WX
 * @Date: 2019/11/11
 * @E-mail: W_SpongeBob@163.com
 * @Desc：
 */
class EncryptAesKey {
  static String _aesK = null;

  static String get  aesK  {
    if (_aesK == null) {
      _aesK = _createKey();
    }
    return _aesK;
  }

  static String _createKey() {
    List<int> arr = [
      110,
      98,
      87,
      111,
      110,
      100,
      101,
      114,
      115,
      71,
      114,
      111,
      117,
      112
    ];
    String string = "";
    for (int i in arr) {
      string += (String.fromCharCode(i));
    }
    var x = 'X';
    string += x.codeUnits[0].toString();
    return string;
  }
}
