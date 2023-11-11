## Merlin
[Merlin](https://merlin.cool) is a [STROBE](https://strobe.sourceforge.io/)-based transcript construction for zero-knowledge proofs.
It automates the [Fiat-Shamir](https://en.wikipedia.org/wiki/Fiat–Shamir_heuristic) transform, so that by using Merlin, non-interactive protocols can be implemented as if they were interactive.

[![codecov](https://codecov.io/gh/justkawal/strobe/graph/badge.svg?token=8FERML02AR)](https://codecov.io/gh/justkawal/merlin)
[![Licence](https://img.shields.io/badge/License-MIT-red.svg)](./LICENSE)
![GitHub contributors](https://img.shields.io/github/contributors/justkawal/merlin)
[![Github Repo Stars](https://img.shields.io/github/stars/justkawal/merlin)](https://github.com/justkawal/merlin/stargazers)
![GitHub Sponsors](https://img.shields.io/github/sponsors/justkawal)


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
