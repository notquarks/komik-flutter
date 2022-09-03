import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/main.dart';
import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/entity/comic_entity.dart';
import 'package:komik_flutter/models/entity/chread_entity.dart';
import 'package:komik_flutter/models/entity/library_entity.dart';
import 'package:komik_flutter/models/lchap_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:komik_flutter/objectbox.g.dart';
import 'package:komik_flutter/screens/read_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ComicPage extends ConsumerStatefulWidget {
  ComicPage({
    Key? key,
    required this.id,
    required this.hid,
    required this.slug,
    required this.title,
    required this.chap,
    required this.cvUrl,
  }) : super(key: key);
  int id;
  String hid;
  String slug;
  String title;
  String chap;
  String cvUrl;

  @override
  ConsumerState<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends ConsumerState<ComicPage> {
  List<DetailsComic> detailsComic = <DetailsComic>[];
  List<ListChapters> chaptersComic = <ListChapters>[];
  List<ComicDescSlug> descComic = <ComicDescSlug>[];
  List<String> readed_chap = [];
  Box<ComicEntity> comicBox = objectBox.store.box<ComicEntity>();
  Box<ChReadEntity> chReadBox = objectBox.store.box<ChReadEntity>();
  Box<LibraryEntity> libraryBox = objectBox.store.box<LibraryEntity>();
  bool isBookmarked = false;

  @override
  void initState() {
    _checkLibrary();
    // objectBox.readHistory(widget.id, readed_chap);
    print(readed_chap.length);
    _fetchData(widget.hid);
    objectBox.addComic(widget.id, widget.hid, widget.title, widget.slug,
        widget.chap, widget.cvUrl);
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
              _detailsComic(descComic.first, context),
              const SliverToBoxAdapter(child: const Divider()),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //Dislay Total Chapters
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '${chaptersComic.first.total} Chapters',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: Divider()),
              _listComicChapters(chaptersComic.first)
            ])
          : _loadingIndicator(),
    );
  }

  Widget _detailsComic(ComicDescSlug comicDetails, BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 255,
            child: Stack(children: [
              //**
              //Background Cover Pic Under Gradient
              // */
              Container(
                width: 1080,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.cvUrl,
                      fit: BoxFit.cover,
                      width: 1080,
                      height: 255,
                    ),
                  ],
                ),
              ),
              //Background Gradient Cover
              Container(
                height: 670,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.92),
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.92),
                        Theme.of(context).scaffoldBackgroundColor,
                        // Color.fromARGB(255, 38, 41, 48)
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
                        //**Cover Comic */
                        Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 168,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
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
                                        objectBox.removeFromLib(widget.id);
                                        _checkLibrary();
                                        // objectBox.removeComic(widget.id);
                                      },
                                      child: const Text('Remove from Library'))
                                  : ElevatedButton(
                                      onPressed: () {
                                        objectBox.addToLib(widget.id);

                                        _checkLibrary();
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
                                  child: Icon(
                                    Icons.public,
                                    color: Theme.of(context)
                                        .buttonTheme
                                        .colorScheme
                                        ?.onSurface,
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
                                child: Icon(
                                  Icons.link,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.onSurface,
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
          //**
          // Comic Description
          // */
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
                        // theme: const ExpandableThemeData(),
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

  //**
  // Comic Title
  // */
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
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                (comicDetails.comic.status == 1) ? 'Ongoing' : 'Completed',
                softWrap: true,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
              Row(
                children: [
                  for (var artist in comicDetails.artists)
                    Text(
                      '${artist.name} ',
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  for (var author in comicDetails.artists)
                    Text(
                      '${author.name} ',
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /**
   ** Build all list chapter
   ** Comic Chapter
   */
  Widget _listComicChapters(ListChapters comicCh) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: comicCh.chapters.length,
        ((context, index) {
          final chTitle = 'Ch. ${comicCh.chapters[index].chap} '
              ' ${comicCh.chapters[index].title ?? ''}';
          return Card(
            // color: const Color.fromARGB(255, 48, 52, 60),
            child: ListTile(
              onTap: () {
                //**
                // Open History and add to db
                // */
                objectBox.addToHistory(
                    comicCh.chapters[index].id,
                    widget.id,
                    comicCh.chapters[index].hid.toString(),
                    widget.hid,
                    chTitle,
                    comicCh.chapters[index].chap);
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

  _checkLibrary() async {
    final getComic = libraryBox.get(widget.id);
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
}
