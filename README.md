## Merlin
[Merlin](https://merlin.cool) is a [STROBE](https://strobe.sourceforge.io/)-based transcript construction for zero-knowledge proofs.
It automates the [Fiat-Shamir](https://en.wikipedia.org/wiki/Fiat–Shamir_heuristic) transform, so that by using Merlin, non-interactive protocols can be implemented as if they were interactive.

## Usage

```dart
  // Simple Transcript
  final transcript = Transcript('test protocol');

  transcript.appendMessage(Uint8List.fromList(utf8.encode('some label')), Uint8List.fromList(utf8.encode('some data')));

  final cBytes = transcript.extractBytes(Uint8List.fromList(utf8.encode('challenge')), 32);

  // cHex = d5a21972d0d5fe320c0d263fac7fffb8145aa640af6e9bca177c03c7efcf0615
  final cHex = hex.encode(cBytes);
  print(cHex);
```

## Donate
If you like this repo and found it useful, please consider **donating ❤️**!! Donation goes towards my tuition fees and helps me maintain merlin and other repos. Thank you so much!!
