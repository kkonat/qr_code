import 'package:cryptography/cryptography.dart';
import 'dart:convert' show utf8;

Future<String> encrypt(String data) async {
  final algorithm = AesCtr.with128bits(
    macAlgorithm: MacAlgorithm.empty, // Hmac.sha256(),\
  );
  final secretKey = SecretKey('0123456789012345'.codeUnits); // 16 bytes
  final nonce = '012345678901'.codeUnits; //12 bytes
  final message = data.codeUnits;
  // Encrypt
  final secretBox = await algorithm.encrypt(
    message,
    nonce: nonce,
    secretKey: secretKey,
  );
  // print('Nonce: ${secretBox.nonce}');
  // print('Ciphertext: ${secretBox.cipherText}');
  // print('MAC: ${secretBox.mac.bytes}');

  var result = utf8.decode(secretBox.nonce, allowMalformed: true) // +
      // utf8.decode(secretBox.cipherText, allowMalformed: true) +
      //utf8.decode(secretBox.mac.bytes, allowMalformed: true)
      ;
  return result;
}
