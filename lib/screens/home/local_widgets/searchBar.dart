import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leagueChamp/state/championsState/championsState.dart';

class SearchChampion extends StatefulWidget {
  @override
  SearchChampionState createState() => SearchChampionState();
}

class SearchChampionState extends State<SearchChampion> {
  final TextEditingController _controller = TextEditingController();
  ChampionsState store;

  @override
  void initState() {
    super.initState();
    store = GetIt.I.get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF2F2F2),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: TextField(
          controller: _controller,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 14),
            hintText: 'Pesquise pelo nome do Campeão...',
            border: OutlineInputBorder(),
            icon: Icon(Icons.search),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          onChanged: (String t) {
            store.searchForChampion(t);
          },
        ),
      ),
    );
  }
}
