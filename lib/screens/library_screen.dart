import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:komik_flutter/collections/comic_col.dart';
import 'package:komik_flutter/components/comic_item.dart';
import 'package:komik_flutter/screens/comic_screen.dart';
import 'package:komik_flutter/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.isar}) : super(key: key);
  final Isar isar;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  List<ComicCol> comics = [];
  Stream<List<ComicCol>> execQuery() {
    if (!isSearching) {
      _readComicCol(widget.isar);
    }
    return widget.isar.comicCols
        .where()
        .limit(1)
        .build()
        .watch(initialReturn: true);
  }

  @override
  void initState() {
    _readComicCol(widget.isar);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('Library'),
                  floating: true,
                  pinned: false,
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SettingPage();
                          }));
                        },
                        icon: const Icon(Icons.settings))
                  ],
                ),
              ];
            },
            floatHeaderSlivers: true,
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 8),
              child: StreamBuilder(
                stream: execQuery(),
                builder: (context, AsyncSnapshot<List<ComicCol?>> data) {
                  if (data.hasData) {
                    if (data.data!.isEmpty) {
                      return const Align(
                        alignment: Alignment.center,
                        child: Text('Nothing to display'),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: comics.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: (2.4 / 4.4),
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (childContext) {
                              return ComicPage(
                                isar: widget.isar,
                                id: comics[index].id,
                                title: comics[index].title,
                                hid: comics[index].hid,
                                slug: comics[index].slug,
                                chap: comics[index].chap,
                                cvUrl: comics[index].cvUrl,
                              );
                            }));
                          },
                          child: ComicListItem3(
                            comic: comics[index],
                          ),
                        ),
                      );
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )));
  }

  Widget headerWidget() {
    return Container(
      child: Text('Helloo World'),
    );
  }

  _readComicCol(Isar isar) async {
    final comicCollection = isar.comicCols;
    final getComic = await comicCollection.where().findAll();
    if (mounted) {
      setState(() {
        comics = getComic;
      });
    }
  }
}
