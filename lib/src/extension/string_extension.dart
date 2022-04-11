extension StringExtension on String {
  /// Converts the string to first character upper case.
  /// hello world -> Hello world
  String toCapitalized() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  /// Converts the string to title case.
  ///
  /// hello world -> Hello World
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  /// Converts the string to title case with spaces.
  ///
  /// HelloWorld -> Hello World
  String toCapitalizedWithSpace() {
    RegExp regExp = RegExp('[A-Z]');
    String string = toTitleCase();
    List<int> matches = regExp.allMatches(string).map((e) => e.start).toList();

    return string.splitMapJoin(regExp, onMatch: ((match) {
      String str = match.input.substring(match.start, match.end);
      if (matches.indexOf(match.start) == 0) {
        return str;
      } else {
        return ' ${str.toLowerCase()}';
      }
    }));
  }

  /// Detects whether the string is english alphabet.
  bool get isEnglish {
    RegExp regExp = RegExp(r'\w+\s*$');
    return regExp.hasMatch(this);
  }

  /// Converts the string to boolean.
  ///
  /// 'true' -> true
  /// 'false' -> false
  bool toBool() => this == 'true';

  /// Detects whether the string is empty.
  ///
  /// '' -> true
  /// ' ' -> true
  /// 'a' -> false
  bool get isAllEmpty => isEmpty || trim().isEmpty;
}
