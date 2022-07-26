import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isar/isar.dart';
import 'package:komik_flutter/collections/comic_col.dart';
import 'package:komik_flutter/collections/history_col.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/lchap_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:komik_flutter/screens/read_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ComicPage extends ConsumerStatefulWidget {
  ComicPage({
    Key? key,
    required this.id,
    required this.hid,
    required this.slug,
    required this.title,
    required this.isar,
    required this.chap,
    required this.cvUrl,
  }) : super(key: key);
  int id;
  String hid;
  String slug;
  String title;
  String chap;
  String cvUrl;
  Isar isar;
  @override
  ConsumerState<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends ConsumerState<ComicPage> {
  List<DetailsComic> detailsComic = <DetailsComic>[];
  List<ListChapters> chaptersComic = <ListChapters>[];
  List<ComicDescSlug> descComic = <ComicDescSlug>[];
  List<String> readed_chap = [];

  bool isBookmarked = false;

  @override
  void initState() {
    _fetchData(widget.hid);
    _checkLibrary(widget.isar);
    _readHistory(widget.isar);
    super.initState();
  }

  Future _fetchData(String hid) async {
    var resultDetails = await ComickApi.getComicDetails(widget.hid);
    var resultChapters = await ComickApi.getListChapters(widget.id);
    var resultDesc = await ComickApi.getComicDescSlug(widget.slug);
    setState(() {
      detailsComic.addAll(resultDetails);
      chaptersComic.addAll(resultChapters);
      descComic.addAll(resultDesc);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final comicDetails = ref.watch(comicInfoProvider(widget.hid));
    return Scaffold(
      body: (detailsComic.isNotEmpty &&
              chaptersComic.isNotEmpty &&
              descComic.isNotEmpty)
          ? CustomScrollView(slivers: [
              SliverAppBar(
                title: Text(widget.title),
                floating: true,
              ),
              _detailsComic(descComic.first),
              SliverToBoxAdapter(child: Divider()),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //Dislay Total Chapters
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '${chaptersComic.first.total} Chapters',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: Divider()),
              _listComicChapters(chaptersComic.first)
            ])
          : _loadingIndicator(),
    );
  }

  Widget _detailsComic(ComicDescSlug comicDetails) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 255,
            child: Stack(children: [
              //Background Cover Pic
              Container(
                width: 1080,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.cvUrl,
                      fit: BoxFit.cover,
                      width: 1080,
                      height: 250,
                    ),
                  ],
                ),
              ),
              //Background Cover
              Container(
                height: 900,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(238, 53, 76, 102),
                        Color.fromARGB(240, 37, 37, 63),
                        Color.fromARGB(255, 38, 41, 48)
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                          width: 720,
                        ),
                        Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.cvUrl,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 16.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: _comicTitleAuthor(comicDetails),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          child: Row(
                            children: [
                              (isBookmarked)
                                  ? ElevatedButton(
                                      onPressed: () {
                                        _removeComic(widget.isar);
                                      },
                                      child: const Text('Remove from Library'))
                                  : ElevatedButton(
                                      onPressed: () {
                                        _addComic(widget.isar);
                                      },
                                      child: const Text('Add to Library')),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          'https://comick.fun/comic/${comicDetails.comic.slug}'),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.public,
                                    color: Color.fromRGBO(139, 157, 195, 1),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                          text:
                                              "https://comick.fun/comic/${comicDetails.comic.slug}"))
                                      .then((result) {
                                    Fluttertoast.showToast(
                                        msg: "Link Copied !");
                                  });
                                },
                                child: const Icon(
                                  Icons.link,
                                  color: Color.fromRGBO(139, 157, 195, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
          ),
          Container(
            // color: Colors.amber,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              // height: 520.h,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // DescText(),
                      ExpandablePanel(
                        theme:
                            const ExpandableThemeData(iconColor: Colors.white),
                        header: const Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 15),
                          child: Text('About'),
                        ),
                        collapsed: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Html(
                              shrinkWrap: true,
                              data: "<p>${comicDetails.comic.desc}</p>",
                              style: {
                                "p": Style(
                                  textOverflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  color: Colors.white,
                                )
                              }),
                        ),
                        expanded: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Html(
                            shrinkWrap: true,
                            data: comicDetails.comic.desc.toString(),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _comicTitleAuthor(ComicDescSlug comicDetails) {
    return SizedBox(
      width: 260,
      height: 165,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comicDetails.comic.title,
                softWrap: true,
                maxLines: 4,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                comicDetails.artists
                    .map((e) => e.name)
                    .toString()
                    .replaceAll(RegExp('[^A-Za-z0-9,]'), ''),
                softWrap: true,
                textAlign: TextAlign.left,
              ),
              Text(
                (comicDetails.comic.status == 1) ? 'Ongoing' : 'Completed',
                softWrap: true,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listComicChapters(ListChapters comicCh) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: comicCh.chapters.length,
        ((context, index) {
          final chTitle = 'Ch. ${comicCh.chapters[index].chap} '
              ' ${comicCh.chapters[index].title ?? ''}';
          return Card(
            color: const Color.fromARGB(255, 48, 52, 60),
            child: ListTile(
              onTap: () {
                _addToHistory(
                    widget.isar,
                    chTitle,
                    comicCh.chapters[index].hid.toString(),
                    comicCh.chapters[index].id);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ReadPage(
                      hid: comicCh.chapters[index].hid.toString(),
                      ch: comicCh.chapters[index].chap.toString(),
                      title: comicCh.chapters[index].title.toString());
                }));
              },
              leading: Text(
                "Ch.\n${comicCh.chapters[index].chap}",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              //title chapter
              title: Text(
                chTitle,
                maxLines: 2,
                style: const TextStyle(fontSize: 13),
              ),
              subtitle: Row(children: [
                Text(
                  comicCh.chapters[index].groupName
                      .toString()
                      .replaceAll(RegExp('[^A-Za-z0-9, ]'), ''),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11.0),
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Center(
        child: SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator()));
  }

  _checkLibrary(Isar isar) async {
    final comicCollection = isar.comicCols;
    final getComic = await comicCollection.get(widget.id);
    if (getComic != null) {
      print(getComic.toString());
      setState(() {
        isBookmarked = true;
      });
    } else {
      setState(() {
        isBookmarked = false;
      });
    }
  }

  _readHistory(Isar isar) async {
    final historyCollection = isar.historys;
    final getHistory = await historyCollection.getByHid(widget.hid);
    if (getHistory != null) {
      if (mounted) {
        setState(() {
          readed_chap = getHistory.read;
        });
      }
    }
  }

  _addToHistory(Isar isar, String chTitle, String hid_chap, int id_chap) async {
    final historyCollection = isar.historys;

    readed_chap.add(hid_chap);
    await isar.writeTxn((isar) async {
      final getComicHistory = await historyCollection.getByHid(widget.hid);
      print(getComicHistory.toString());
      if (getComicHistory == null) {
        final addHistory = History()
          ..id = widget.id
          ..hid = hid_chap
          ..lastRead = DateTime.now()
          ..chapter_title = chTitle
          ..title = widget.title
          ..slug = widget.slug
          ..ch_id = id_chap
          ..cvUrl = widget.cvUrl
          ..read = readed_chap.toSet().toList();
        await historyCollection.put(addHistory);
      } else {
        print('TEst');
        getComicHistory.ch_id = id_chap;
        getComicHistory.hid = hid_chap;
        getComicHistory.chapter_title = chTitle;
        getComicHistory.lastRead = DateTime.now();
        getComicHistory.read = readed_chap.toSet().toList();
        getComicHistory.cvUrl = widget.cvUrl;
        await historyCollection.put(getComicHistory);
      }
    });
  }

  _addComic(Isar isar) async {
    final comicCollection = isar.comicCols;
    final addComic = ComicCol()
      ..id = widget.id
      ..hid = widget.hid
      ..slug = widget.slug
      ..title = widget.title
      ..chap = widget.chap
      ..cvUrl = widget.cvUrl;
    await isar.writeTxn((isar) async {
      await comicCollection.put(addComic, saveLinks: true);
    });
    _checkLibrary(isar);
  }

  _removeComic(Isar isar) async {
    final comicCollection = isar.comicCols;
    await isar.writeTxn((isar) async {
      comicCollection.delete(widget.id);
    });
    setState(() {
      isBookmarked = false;
    });
    _checkLibrary(isar);
  }
}
