import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:komik_flutter/controllers/db_interface.dart';
import 'package:komik_flutter/models/entity/comic_entity.dart';
import 'package:komik_flutter/models/entity/history_entity.dart';
import 'package:objectbox/objectbox.dart';
import 'package:komik_flutter/main.dart';
import 'package:komik_flutter/models/entity/chread_entity.dart';
import 'package:komik_flutter/models/entity/library_entity.dart';
import 'package:komik_flutter/objectbox.g.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final comicBox = objectBox.store.box<ComicEntity>();
  final historyBox = objectBox.store.box<HistoryEntity>();

  Stream<List<HistoryEntity>> _fetchRecentHistory() {
    return historyBox
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverAppBar(
            title: const Text('History'),
            floating: true,
            snap: true,
            pinned: false,
            actions: [
              IconButton(
                  onPressed: () {
                    objectBox.deleteAllHistory();
                  },
                  icon: const Icon(Icons.delete_forever))
            ],
          ),
          SliverFillRemaining(
            child: SafeArea(
              top: false,
              minimum: const EdgeInsets.symmetric(horizontal: 6),
              child: StreamBuilder<List<HistoryEntity>>(
                  stream: _fetchRecentHistory(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        final historys = snapshot.data!;
                        historys.sort((b, a) {
                          return a.history.target!.lastRead
                              .compareTo(b.history.target!.lastRead);
                        });
                        return ListView.builder(
                          itemCount: historys.length,
                          itemBuilder: (context, index) {
                            print('Print comic box: ${comicBox.count()}');
                            final history = historys[index];
                            // final comic = history.comic.target!.historys.last;
                            // print(history.history.target!.ch_title);
                            // print(history.history.target!.comic.target!.title);
                            return Card(
                              color: const Color.fromARGB(255, 61, 66, 75),
                              child: ListTile(
                                title: Text(history
                                    .history.target!.comic.target!.title),
                                subtitle:
                                    Text(history.history.target!.ch_title),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Empty'),
                          ],
                        ));
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
