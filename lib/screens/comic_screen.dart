import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/controllers/save_data.dart';
import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/lchap_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:komik_flutter/models/save_comic.dart';
import 'package:komik_flutter/screens/read_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ComicPage extends ConsumerStatefulWidget {
  ComicPage({Key? key, required this.comic, required this.hid})
      : super(key: key);
  LibComic comic;
  String hid;

  @override
  ConsumerState<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends ConsumerState<ComicPage> {
  List<DetailsComic> detailsComic = <DetailsComic>[];
  List<ListChapters> chaptersComic = <ListChapters>[];
  List<ComicDescSlug> descComic = <ComicDescSlug>[];
  @override
  void initState() {
    _fetchData(widget.hid);
    super.initState();
  }

  Future _fetchData(String hid) async {
    var resultDetails = await ComickApi.getComicDetails(widget.hid);
    var resultChapters =
        await ComickApi.getListChapters(widget.comic.mdComics.id);
    var resultDesc =
        await ComickApi.getComicDescSlug(widget.comic.mdComics.slug);
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
                title: Text(widget.comic.mdComics.title),
                floating: true,
              ),
              _detailsComic(widget.comic, descComic.first),
              SliverToBoxAdapter(child: Divider()),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '${chaptersComic.first.chapters.length} Chapters',
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

  Widget _detailsComic(LibComic comic, ComicDescSlug comicDetails) {
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
                      imageUrl: (comic.mdComics.mdCovers[0].gpurl != null)
                          ? "${comic.mdComics.mdCovers[0].gpurl}.256.jpg"
                          : 'https://meo.comick.pictures/${comic.mdComics.mdCovers[0].b2Key}',
                      fit: BoxFit.cover,
                      width: 1080,
                      height: 255,
                    ),
                  ],
                ),
              ),
              Container(
                height: 670,
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
                                      imageUrl: (comic
                                                  .mdComics.mdCovers[0].gpurl !=
                                              null)
                                          ? "${comic.mdComics.mdCovers[0].gpurl}.256.jpg"
                                          : 'https://meo.comick.pictures/${comic.mdComics.mdCovers[0].b2Key}',
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
                              ElevatedButton(
                                  onPressed: () {},
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
          return Card(
            color: const Color.fromARGB(255, 48, 52, 60),
            child: ListTile(
              onTap: () {
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
}
