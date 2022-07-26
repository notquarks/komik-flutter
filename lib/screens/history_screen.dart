import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:isar/isar.dart';
import 'package:komik_flutter/collections/history_col.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.isar}) : super(key: key);
  final Isar isar;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<History> history = [];
  @override
  void initState() {
    _readHistoryCol(widget.isar);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _readHistoryCol(widget.isar)),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('History'),
              floating: true,
              actions: [
                IconButton(
                    onPressed: () {
                      _deleteAllHistory(widget.isar);
                    },
                    icon: const Icon(Icons.delete_forever))
              ],
            ),
            (history.isEmpty)
                ? SliverFillRemaining(
                    child: Center(
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Empty'),
                    ],
                  )))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: history.length,
                      (context, index) {
                        return ListTile(
                          title: Text(history[index].title),
                          subtitle: Text(history[index].chapter_title),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  _deleteAllHistory(Isar isar) async {
    final historyCollection = isar.historys;
    await isar.writeTxn((isar) async {
      historyCollection.clear();
    });
    _readHistoryCol(widget.isar);
  }

  _readHistoryCol(Isar isar) async {
    final historyCollection = isar.historys;
    final getHistory = await historyCollection
        .where(distinct: true, sort: Sort.desc)
        .sortByLastRead()
        .findAll();

    setState(() {
      history = getHistory;
    });
  }
}
