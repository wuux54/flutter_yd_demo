// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child ui.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_world/ui/page/splash.dart';
import 'package:flutter_video_world/utils/utils_aes_key.dart';
import 'package:flutter_video_world/utils/utils_encrypt.dart';
import 'package:steel_crypt/steel_crypt.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SplashStatePage());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test("aes encrypt", () async {
//    String encodeAes = await EncryptHelper.encodeAes(
//        "json", "my 32 length key................");
//    print("encodeAes -- >$encodeAes \n");
//    String decodeAes = await EncryptHelper.decodeAes(
//        encodeAes, "my 32 length key................");
//    print("decodeAes -- >$decodeAes");

    String key = "-----BEGIN PUBLIC KEY-----\n" +
        "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJuvjMXlmt1QaC0Thcmvlbq41GGUkBIR\n" +
        "vsh8UiFvZlY2ar1Hgz/pKdFf/B6j/01vdibvhOd6U9KV27+hSUK4kVkCAwEAAQ==\n" +
        "-----END PUBLIC KEY-----\n";

    String encodeRsa = await EncryptHelper.encodeRsa("json", key);
    print("encodeRsa -- >$encodeRsa");

    String priKey = "-----BEGIN RSA PRIVATE KEY-----\n" +
        "MIIBnjBABgkqhkiG9w0BBQ0wMzAbBgkqhkiG9w0BBQwwDgQITk9D+31PebsCAggA\n" +
        "MBQGCCqGSIb3DQMHBAjVUPjpexhD/QSCAViIR2FPutGL4yvj8HHhoNIMxaK0dymX\n" +
        "KW9bGoXjomLm5tfiB2WCfrFsIpNdGQUo+wQPGnm9DyaRTPY9yjHjT89Q1QIHjf3p\n" +
        "EEPjXKPvghDnXb9CsbZ0stpfOYsBZ+d8emZFUIEBrS6YxaIrrO8268QWnO28z27t\n" +
        "2L8DIa2uMeq3Zj3QvfBztGWbYXwVbFFZ/VsjIb5ZBsxFcyTqg9rXi/XE7nVLzFcj\n" +
        "RHRw/tUu6LIbkHtCcvJ/VQtq97PW0AD7RnKLh7afHHQiwLfDeQ6GBJ+32ra48El5\n" +
        "iBkhTV/MW12T2C77W1lZPcIliNq6WoM2gIKOtS7rKz0wFADj0dUl8yCTqH6KQU+n\n" +
        "ztke91fWnH7W3GtW5TCIBY44H/ce3e+IesygAKTtGH8TRzrQu11MCK8EIQV4k7K4\n" +
        "r8k4qNZYQ2Fa1gz4h/mgSY7/BsJbz0pIkJMQtX6oQS/ipQ==\n" +
        "-----END RSA PRIVATE KEY-----\n";

    String decodeRsa = await EncryptHelper.decodeRsa(encodeRsa, priKey);
    print("decodeRsa -- >$decodeRsa");
  });

  test("net test", () async {
//    String d =
//        "{\"accessToken\":\"\",\"deviceId\":\"4d44c3a7a0a12d98@1589514542027/comm-api/homePage/getCommProduct\",\"reqType\":\"GET\",\"targetURI\":\"/comm-api/homePage/getCommProduct\",\"timeStamp\":\"1589514542027\",\"uriData\":\"{\\\"pageType\\\":\\\"1\\\"}\"}";
    String s =
        "xseJr3ON3smLv0rMMmXhdqDCadWFvd4mYbCAshGGRAxtwWvHEXbYsTV8IVr9w2K2154/px3G43Dm8CAuO1LrajEAk3tUD2I/tpRAEuwKb6Y9iuh19ZrIbAn6WGa1ek2nqqpwT7dFRH5IfJMiXQEFSiQIsdXFTol2rzNiov6JZr5RLhYKkDF1D0w878RgF/thfBuU8eLtxSAnibgVHrigYH+KSynezcScF00944le7+HgYZQxK4n3iqWgp9tNTg02nrp7BXl6/uQRh8S9yGlyoGJjzAiNhUvUv7UAidCSXk0=";
    print(EncryptHelper.decodeAes(s, EncryptAesKey.aesK));
//
//    var data = "{\"username\":\"helloword\"}";
//
////生成16字节的随机密钥
//    var key = await FlutterAesEcbPkcs5.generateDesKey(128);
//
//    print(key);
////加密
//    var encryptText = await FlutterAesEcbPkcs5.encryptString(data, key);
//
//    print(encryptText);
////解密
//    var decryptText  = await FlutterAesEcbPkcs5.decryptString(encryptText, key);
//
//    print(decryptText);

    print("aesE -> ${EncryptHelper.decodeAes(s, EncryptAesKey.aesK)}");
    print("aesE en -> ${EncryptHelper.encodeAes("这是个测试", EncryptAesKey.aesK)}");
    print(
        "aesE dd -> ${EncryptHelper.decodeAes(EncryptHelper.encodeAes("这是个测试", EncryptAesKey.aesK), EncryptAesKey.aesK)}");

//    var FortunaKey = CryptKey().genFortuna(); //generate 32 byte key generated with Fortuna
//
//
//    var aesEncrypter = AesCrypt(FortunaKey, 'cbc',
//        'iso10126-2'); //generate AES block encrypter with key and ISO7816-4 padding
//
//    var aesEncrypter2 = AesCrypt(FortunaKey, 'ofb-64',
//        'pkcs7'); //generate AES OFB-64 block encrypter with key and PKCS7 padding
//
//    var streamAES = AesCrypt(FortunaKey, 'ctr'); //generate AES CTR stream encrypter with key
//
//
//    var encrypter2 = RsaCrypt(); //generate RSA encrypter
//
//
//    var encrypter3 = LightCrypt(FortunaKey, "ChaCha20/12"); //generate ChaCha20/12 encrypter
//
//
//    var hasher = HashCrypt("SHA-3/512"); //generate SHA-3/512 hasher
//
//    var hasher3 = MacCrypt(FortunaKey, "CMAC", 'cfb-64'); //CMAC AES CFB-64 Hasher
//
//
//    var passHash = PassCrypt('scrypt'); //generate scrypt password hasher
//
//
//    var ivsalt = CryptKey().genDart(
//        16); //generate iv for AES with Dart Random.secure()
//
//    var iv2 = CryptKey().genDart(8); //generate iv for ChaCha20 with Dart Random.secure()
//
//    //Print key
//    print ("Key:");
//
//    print(FortunaKey);
//
//    print("");
//
//
//    //Print IV
//    print ("IV (AES/Scrypt):");
//
//    print(ivsalt);
//
//    print("");
//
//    //Print IV
//    print ("IV (ChaCha20):");
//
//    print(iv2);
//
//    print("");
//
//    //SHA-3 512 Hash
//    print("SHA-3 512 Hash:");
//
//    String hash = hasher.hash('example'); //perform hash
//
//    print(hash);
//
//    print(hasher.checkhash('example', hash)); //perform check
//
//    print("");
//
//    //CMAC AES CFB-64 Hash
//    print("CMAC AES CFB-64 Hash:");
//
//    var hash3 = hasher3.process('words'); //perform hash
//
//    print(hash3);
//
//    print(hasher3.check('words', hash3)); //perform check
//
//    print("");
//
//    //Password (scrypt)
//    print("Password hash (scrypt):");
//
//    var hash4 = passHash.hashPass(ivsalt, "words"); //perform hash
//
//    print(hash4);
//
//    print(passHash.checkPassKey(ivsalt, "words", hash4)); //perform check
//
//    print("");
//
//
//    //12-Round ChaCha20; Symmetric stream cipher
//    print("ChaCha20 Symmetric:");
//
//    String crypted3 = encrypter3.encrypt('broken', iv2); //encrypt
//
//    print(crypted3);
//
//    print(encrypter3.decrypt(crypted3, iv2)); //decrypt
//
//    print("");
//
//
//    //AES CBC with ISO7816-4 padding; Symmetric block cipher
//    print("AES Symmetric CBC:");
//
//    String crypted = aesEncrypter.encrypt('words', ivsalt); //encrypt
//
//    print(crypted);
//
//    print(aesEncrypter.decrypt(crypted, ivsalt)); //decrypt
//
//    print("");
//
//
//    //AES OFB-64 with PKCS7 padding; Symmetric block cipher
//    print("AES Symmetric OFB-64:");
//
//    String crypted2 = aesEncrypter2.encrypt('words', ivsalt); //encrypt
//
//    print(crypted2);
//
//    print(aesEncrypter2.decrypt(crypted2, ivsalt)); //decrypt
//
//    print("");
//
//
//    //AES CTR; Symmetric stream cipher
//    print("AES Symmetric CTR:");
//
//    String crypted5 = streamAES.encrypt('words', ivsalt); //Encrypt.
//
//    print(crypted5);
//
//    print(streamAES.decrypt(crypted5, ivsalt)); //Decrypt.
//
//    print("");
//
//
//    //RSA with OAEP padding; Asymmetric
//    print("RSA Asymmetric:");
//
//    var crypted4 = encrypter2.encrypt("word", encrypter2.randPubKey); //encrypt
//
//    print(crypted4);
//
//    print(encrypter2.decrypt(crypted4, encrypter2.randPrivKey)); //decrypt
  });

  test("获取dimens",(){
    for(double i = 0.0;i< 362 ; i++){
      print("static const double dp_${i.truncate()} = $i;\n");
      print("static const double dp_${i.truncate()}_25 = ${i.truncate()}.25 ;");
      print("static const double dp_${i.truncate()}_5 = ${i.truncate()}.5 ;");
      print("static const double dp_${i.truncate()}_75 = ${i.truncate()}.75 ;");
    }
  });

}
