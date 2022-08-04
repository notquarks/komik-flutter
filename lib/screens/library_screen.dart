import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:komik_flutter/components/comic_item.dart';
import 'package:komik_flutter/main.dart';
import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/entity/comic_entity.dart';
import 'package:komik_flutter/models/entity/library_entity.dart';
import 'package:komik_flutter/objectbox.g.dart';
import 'package:komik_flutter/screens/comic_screen.dart';
import 'package:komik_flutter/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  late Stream<List<ComicEntity>> streamComics;
  Box<LibraryEntity> libraryEntity = objectBox.store.box<LibraryEntity>();

  Stream<List<LibraryEntity>> _fetchFavComic() {
    return libraryEntity
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  @override
  void initState() {
    // comicBox = objectBox.store.box<ComicEntity>();
    _fetchFavComic();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // objectBox.store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  title: const Text('Library'),
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
            body: SafeArea(
              top: false,
              minimum: const EdgeInsets.symmetric(horizontal: 8),
              child: StreamBuilder(
                stream: _fetchFavComic(),
                builder: (context, AsyncSnapshot<List<LibraryEntity>> data) {
                  if (data.hasData) {
                    if (data.data!.isEmpty) {
                      return const Align(
                        alignment: Alignment.center,
                        child: Text('Nothing to display'),
                      );
                    } else {
                      final comics = data.data!;
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
                                id: comics[index].id,
                                title: comics[index].comic.target!.title,
                                hid: comics[index].comic.target!.hid,
                                slug: comics[index].comic.target!.slug,
                                chap: comics[index].comic.target!.chap,
                                cvUrl: comics[index].comic.target!.cvUrl,
                              );
                            }));
                          },
                          child: ComicListItem3(
                            comic: comics[index].comic.target!,
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

  // _readComicCol() async {
  //   final getComic = comicBox!.getAll();
  //   if (mounted) {
  //     setState(() {
  //       comics = getComic;
  //     });
  //   }
  // }
}
