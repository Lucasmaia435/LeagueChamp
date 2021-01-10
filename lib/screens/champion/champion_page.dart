import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leagueChamp/models/champion.dart';
import 'package:leagueChamp/models/championDetailed.dart';
import 'package:leagueChamp/screens/champion/local_widgets/info_tab.dart';
import 'package:leagueChamp/state/selectedChampionState/selectedChampionState.dart';
import 'package:leagueChamp/styles/fonts.dart';
import 'package:leagueChamp/utils/utf8_string.dart';

import 'local_widgets/status_tab.dart';

class ChampionPage extends StatefulWidget {
  ChampionPage({Key key, this.champion, this.tag}) : super(key: key);

  final Champion champion;
  final String tag;
  @override
  _ChampionPageState createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage>
    with SingleTickerProviderStateMixin {
  SelectedChampionState store;
  TabController controller;

  @override
  void initState() {
    super.initState();
    store = GetIt.I.get();

    store.selectChampion(widget.champion.id);

    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.champion != null) {
        return Scaffold(
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    backgroundColor: Colors.blue,
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.4,
                    flexibleSpace: background(c: store.champion),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        controller: controller,
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            icon: Icon(Icons.info),
                            text: "Sobre",
                          ),
                          Tab(
                            icon: Icon(Icons.show_chart_sharp),
                            text: "Status",
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                controller: controller,
                children: [
                  InfoChampionTab(store: store),
                  StatusChampionTab(store: store),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  Widget background({@required ChampionDetailed c}) {
    return Hero(
      tag: 'selected-champ-${widget.tag}',
      child: FlexibleSpaceBar(
        title: Text(
          '${widget.champion.name}, ${formatUTF8(store.champion.title)}',
          style: TextStyle(color: Colors.white),
        ),
        background: Image.network(
          'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${store.champion.id}_0.jpg',
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget sessionTitle({@required String title}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      title,
      textAlign: TextAlign.start,
      style: AppFonts.sectionTitle,
    ),
    SizedBox(
      height: 10,
    ),
  ]);
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
