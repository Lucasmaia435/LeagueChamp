import 'dart:convert' as convert;
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:leagueChamp/models/champion.dart';
import 'package:leagueChamp/models/championDetailed.dart';
import 'package:leagueChamp/state/versionState/versionState.dart';

final String dataVersion = '11.1.1';

String championsApi(String version) =>
    'http://ddragon.leagueoflegends.com/cdn/${version == '' ? '11.1.1' : version}/data/pt_BR/champion.json';

String champion(String name, String version) {
  return 'http://ddragon.leagueoflegends.com/cdn/${version == '' ? '11.1.1' : version}/data/pt_BR/champion/$name.json';
}

Future<String> fetchVersion() async {
  var response =
      await http.get('https://ddragon.leagueoflegends.com/api/versions.json');

  if (response.statusCode == 200) {
    var data = convert.jsonDecode(response.body);
    return data[0];
  } else {
    return dataVersion;
  }
}

Future<List<Champion>> fetchChampions() async {
  List<Champion> l = [];
  var response = await http
      .get(championsApi(GetIt.instance<VersionState>().version.value));

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    Map<String, dynamic> d = jsonResponse['data'];
    for (int i = 0; i < d.keys.length; i++) {
      Champion c = Champion.fromJson(d[d.keys.elementAt(i)]);

      l.add(c);
    }
    return l;
  } else {
    return [];
  }
}

Future<ChampionDetailed> fetchChampionDetailed(String name) async {
  var response = await http
      .get(champion(name, GetIt.instance<VersionState>().version.value));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    Map<String, dynamic> d = jsonResponse['data'];
    ChampionDetailed c = ChampionDetailed.fromJson(d[name]);
    return c;
  } else {
    throw Exception('Champion não identificado');
  }
}
