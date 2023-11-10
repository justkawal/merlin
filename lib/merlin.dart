import 'dart:convert';
import 'dart:typed_data';
import 'package:strobe/strobe.dart';

const merlinProtocolLabel = 'Merlin v1.0';
const domainSeparatorLabel = 'dom-sep';

class Transcript {
  late Strobe s;
  Transcript(String appLabel) {
    s = Strobe.initStrobe(merlinProtocolLabel, Security.bit128);
    appendMessage(utf8.encode(domainSeparatorLabel), utf8.encode(appLabel));
  }

  // Append adds the message to the transcript with the supplied label.
  void appendMessage(List<int> label, List<int> message) {
    final sizeBuffer = Uint8List(4);
    ByteData.view(sizeBuffer.buffer)
        .setUint32(0, message.length, Endian.little);

    final labelSize = Uint8List.fromList([...label, ...sizeBuffer]);
    s
      ..aD(true, labelSize)
      ..aD(false, message);
  }

  // ExtractBytes returns a buffer filled with the verifier's challenge bytes.
  // The label parameter is metadata about the challenge, and is also appended to
  // the transcript. See the Transcript Protocols section of the Merlin website
  // for details on labels.
  List<int> extractBytes(List<int> label, int outLen) {
    final sizeBuffer = Uint8List(4);
    ByteData.view(sizeBuffer.buffer).setUint32(0, outLen, Endian.little);

    final labelSize = Uint8List.fromList([...label, ...sizeBuffer]);
    s.aD(true, labelSize);

    return s.prf(outLen);
  }
}
