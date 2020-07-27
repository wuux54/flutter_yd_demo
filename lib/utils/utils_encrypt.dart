import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

/**
 * AES:对称加密，一个密钥，可加密，可解密。
 * RSA:非对称加密，公钥加密，私钥解密,接口获取公钥加密密码等数据，上传。
 */

import 'package:encrypt/encrypt.dart';
import 'package:flutter_video_world/net/http_manager.dart';
import 'package:steel_crypt/PointyCastleN/asymmetric/api.dart';
import 'package:steel_crypt/steel_crypt.dart';

class EncryptHelper {
  /*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  static String encodeAes(String json, String aesKey) {
    var aesE = AesCrypt(aesKey, 'cbc', 'iso10126-2');
    return aesE.encrypt(json, aesKey);//iv 服务器用的就是密钥，所以这里直接用了
  }

  static String decodeAes(String json, String aesKey) {
    var aesE = AesCrypt(aesKey, 'cbc', 'iso10126-2');
    return aesE.decrypt(json, aesKey);
  }

  static String encodeRsa(String json, String pubRsaKey) {
    final publicKey = RSAKeyParser().parse(pubRsaKey);

    return Encrypter(RSA(publicKey: publicKey)).encrypt(json).base64;
  }

  static String decodeRsa(String json, String privateRsaKey) {
    final privateKey = RSAKeyParser().parse(privateRsaKey);

    return Encrypter(RSA(privateKey: privateKey)).decrypt64(json);
  }
}
