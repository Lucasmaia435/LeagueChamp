import 'dart:convert';

String formatUTF8(String string) {
  return utf8.decode(string.toString().codeUnits);
}
