import 'package:leagueChamp/utils/utf8_string.dart';
import 'dart:core';

String formatSkill(String string) {
  String s = formatUTF8(string);

  s = s.replaceAll('<br>', '\n');

  s = s.replaceAll('<physicalDamage>', '');
  s = s.replaceAll('</physicalDamage>', '');

  s = s.replaceAll('<keywordMajor>', '');
  s = s.replaceAll('</keywordMajor>', '');

  s = s.replaceAll('</font>', '');
  if (s.contains('<') && s.contains('>')) {
    String tempString = s.split('<')[0];
    String tempString2 = s.split('>')[1];
    s = tempString + tempString2;
  }

  return s;
}
