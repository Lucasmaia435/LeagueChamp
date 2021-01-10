import 'package:flutter/material.dart';
import 'package:leagueChamp/screens/home/home.dart';
import 'package:leagueChamp/state/championsState/championsState.dart';
import 'package:get_it/get_it.dart';
import 'package:leagueChamp/state/selectedChampionState/selectedChampionState.dart';
import 'package:leagueChamp/state/versionState/versionState.dart';

final getIt = GetIt.instance;

void main() {
  setup();
  runApp(MyApp());
}

void setup() {
  getIt.registerSingleton<ChampionsState>(ChampionsState());
  getIt.registerSingleton<SelectedChampionState>(SelectedChampionState());
  getIt.registerSingleton<VersionState>(VersionState());

  GetIt.instance<VersionState>().updateVersion();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.transparent,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Colors.white,
        alignment: Alignment.center,
        child: Home(),
      ),
    );
  }
}
