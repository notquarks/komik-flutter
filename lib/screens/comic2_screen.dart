import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:komik_flutter/controllers/db_interface.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/main.dart';
import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/lchap_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:komik_flutter/models/top_comic.dart';
import 'package:komik_flutter/screens/read_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ComicPage2 extends ConsumerStatefulWidget {
  ComicPage2(
      {Key? key, required this.comic, required this.slug, required this.cvUrl})
      : super(key: key);
  Completion comic;
  String slug;
  String cvUrl;

  @override
  ConsumerState<ComicPage2> createState() => _ComicPage2State();
}

class _ComicPage2State extends ConsumerState<ComicPage2> {
  List<DetailsComic> detailsComic = <DetailsComic>[];
  List<ListChapters> chaptersComic = <ListChapters>[];
  List<ComicDescSlug> descComic = <ComicDescSlug>[];
  bool isBookmarked = false;

  @override
  void initState() {
    _fetchData(widget.slug).then((value) {
      _fetchData2(descComic.first.comic.id).then((value) async {
        _checkLibrary(descComic.first.comic.id);
        var resultDetails = await ComickApi.getComicDetails(
            chaptersComic.first.chapters.first.hid!);
        setState(() {
          detailsComic.addAll(resultDetails);
        });
        objectBox.addComic(
            descComic.first.comic.id,
            detailsComic.first.chapter.hid,
            widget.comic.title,
            widget.slug,
            chaptersComic.first.total.toString(),
            widget.cvUrl);
      });
    });

    super.initState();
  }

  Future _fetchData(String slug) async {
    var resultDesc = await ComickApi.getComicDescSlug(slug);
    setState(() {
      descComic.addAll(resultDesc);
    });
  }

  Future _fetchData2(int hid) async {
    var resultChapters = await ComickApi.getListChapters(hid);
    setState(() {
      chaptersComic.addAll(resultChapters);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final comicDetails = ref.watch(comicInfoProvider(widget.hid));
    return Scaffold(
      body: (chaptersComic.isNotEmpty && descComic.isNotEmpty)
          ? CustomScrollView(slivers: [
              SliverAppBar(
                title: Text(widget.comic.title),
                floating: true,
              ),
              _detailsComic(widget.comic, descComic.first, context),
              const SliverToBoxAdapter(child: Divider()),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '${chaptersComic.first.chapters.length} Chapters',
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

  Widget _detailsComic(
      Completion comic, ComicDescSlug comicDetails, BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 255,
            child: Stack(children: [
              Container(
                width: 1080,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: (comic.mdCovers.first.gpurl != null)
                          ? "${comic.mdCovers.first.gpurl}.256.jpg"
                          : 'https://meo.comick.pictures/${comic.mdCovers.first.b2Key}',
                      fit: BoxFit.cover,
                      width: 1080,
                      height: 255,
                    ),
                  ],
                ),
              ),
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
                                        imageUrl: (comic.mdCovers.first.gpurl !=
                                                null)
                                            ? "${comic.mdCovers.first.gpurl}.256.jpg"
                                            : 'https://meo.comick.pictures/${comic.mdCovers.first.b2Key}'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 16.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: SizedBox(
                                      width: 260,
                                      height: 165,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                comicDetails.comic.title,
                                                softWrap: true,
                                                maxLines: 4,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              Text(
                                                (comicDetails.comic.status == 1)
                                                    ? 'Ongoing'
                                                    : 'Completed',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  for (var artist
                                                      in comicDetails.artists)
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
                                                  for (var author
                                                      in comicDetails.artists)
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
                                    ),
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
                                        objectBox.removeFromLib(
                                            descComic.first.comic.id);
                                        _checkLibrary(descComic.first.comic.id);
                                      },
                                      child: const Text('Remove from Library'))
                                  : ElevatedButton(
                                      onPressed: () {
                                        objectBox
                                            .addToLib(descComic.first.comic.id);
                                        _checkLibrary(descComic.first.comic.id);
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
              width: 1080,
              // height: 520.h,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // DescText(),
                      ExpandablePanel(
                        // theme:
                        //     const ExpandableThemeData(iconColor: Colors.white),
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

  Widget _listComicChapters(ListChapters comicCh) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: comicCh.chapters.length,
        ((context, index) {
          final chTitle = 'Ch. ${comicCh.chapters[index].chap} '
              ' ${comicCh.chapters[index].title ?? ''}';
          return Card(
            color: Theme.of(context).cardColor,
            child: ListTile(
              onTap: () {
                objectBox.addToHistory(
                    comicCh.chapters[index].id,
                    descComic.first.comic.id,
                    comicCh.chapters[index].hid.toString(),
                    detailsComic.first.chapter.hid,
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
              title: Text(
                'Ch. ${comicCh.chapters[index].chap} '
                ' ${comicCh.chapters[index].title ?? ''}',
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

  _checkLibrary(int id) async {
    final getComic = objectBox.libraryBox.get(id);
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
