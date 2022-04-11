import 'package:rpmtw_dart_common_library/src/extension/string_extension.dart';
import 'package:test/test.dart';

void main() {
  test('convert to capitalized', () {
    String str = 'hello world';
    String newStr = str.toCapitalized();
    expect(newStr, 'Hello world');
  });

  test('convert to capitalized with space', () {
    String str = 'HelloWorld';
    String newStr = str.toCapitalizedWithSpace();
    expect(newStr, 'Hello world');
  });

  test('convert to title case', () {
    String str = 'hello world';
    String newStr = str.toTitleCase();
    expect(newStr, 'Hello World');
  });

  test('is english alphabet with english', () {
    String str = 'hello world';
    expect(str.isEnglish, true);
  });

  test('is english alphabet with chinese', () {
    String str = '你好，世界！';
    expect(str.isEnglish, false);
  });

  test('convert to bool with true', () {
    String str = 'true';
    expect(str.toBool(), true);
  });

  test('convert to bool with false', () {
    String str = 'false';
    expect(str.toBool(), false);
  });

  test('is all empty with empty', () {
    String str = '';
    expect(str.isAllEmpty, true);
  });

  test('is all empty with space', () {
    String str = ' ';
    expect(str.isAllEmpty, true);
  });

  test('is all empty with not empty', () {
    String str = 'a';
    expect(str.isAllEmpty, false);
  });
}
