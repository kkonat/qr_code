import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qr_code/utils.dart';

void main() {
  test('test encrypt', () async {
    final payload = "Encrypt me";
    final encrypted = await encrypt(payload);
    debugPrint('encrypted: $encrypted');
  });
}
