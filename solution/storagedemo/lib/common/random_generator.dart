import 'dart:math';

class RandomGenerator {
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            Random().nextInt(_chars.length),
          ),
        ),
      );
  static int getRandomInt() => Random().nextInt(99);
}
