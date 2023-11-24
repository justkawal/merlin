import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:merlin/merlin.dart';
import 'package:test/test.dart';

void main() {
  test('Test Simple Transcript', () {
    final mt = Transcript('test protocol');
    mt.appendMessage(utf8.encode('some label'), utf8.encode('some data'));

    final cBytes = mt.extractBytes(utf8.encode('challenge'), 32);
    final cHex = hex.encode(cBytes);

    expect(cHex,
        'd5a21972d0d5fe320c0d263fac7fffb8145aa640af6e9bca177c03c7efcf0615');
  });

  test('Test Complex Transcript', () {
    final tr = Transcript('test protocol');
    tr.appendMessage(utf8.encode('step1'), utf8.encode('some data'));

    final data = Uint8List(1024)..fillRange(0, 1024, 99);

    late Uint8List chlBytes;
    for (var i = 0; i < 32; i++) {
      chlBytes = tr.extractBytes(utf8.encode('challenge'), 32);
      tr
        ..appendMessage(utf8.encode('bigdata'), data)
        ..appendMessage(utf8.encode('challengedata'), chlBytes);
    }
    final chlHex = hex.encode(chlBytes);

    expect(chlHex,
        'a8c933f54fae76e3f9bea93648c1308e7dfa2152dd51674ff3ca438351cf003c');
  });
}
