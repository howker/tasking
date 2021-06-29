import 'dart:math';

const _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890_';
Random _random = Random();

String getRandomId(
  int length, [
  String chars = _chars,
]) =>
    String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          _random.nextInt(chars.length),
        ),
      ),
    );
