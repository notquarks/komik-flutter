import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/models/details_comic.dart';

class ReadPage extends StatefulWidget {
  ReadPage({Key? key, required this.hid, required this.ch, required this.title})
      : super(key: key);
  String hid;
  String ch;
  String title;
  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  List<DetailsComic> detailsComic = <DetailsComic>[];
  @override
  void initState() {
    _fetchData(widget.hid);
    super.initState();
  }

  Future _fetchData(String hid) async {
    var resultDetails = await ComickApi.getComicDetails(widget.hid);
    setState(() {
      detailsComic.addAll(resultDetails);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (detailsComic.isNotEmpty)
          ? Scrollbar(
              thumbVisibility: true,
              interactive: true,
              thickness: 12,
              radius: Radius.circular(10),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                        'Ch. ${widget.ch} ${widget.title == 'null' ? '' : widget.title}'),
                    floating: true,
                    actions: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: detailsComic.first.chapter.mdImages.length,
                      (context, index) {
                        return Container(
                          child:
                              // child: Image.network(
                              //     'https://meo.comick.pictures/${detailsComic.first.chapter.mdImages[index].b2Key}'),
                              CachedNetworkImage(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitWidth,
                            maxWidthDiskCache:
                                (MediaQuery.of(context).size.width / (0.6))
                                    .toInt(),
                            imageUrl:
                                'https://meo.comick.pictures/${detailsComic.first.chapter.mdImages[index].b2Key}',
                            placeholder: (context, url) => CachedNetworkImage(
                              imageUrl:
                                  'https://i0.wp.com/elkadii.ponpes.id/wp-content/uploads/2018/10/placeholder.jpg?ssl=1',
                              fit: BoxFit.fitWidth,
                              cacheKey: "meo.comick.pictures",
                              cacheManager: CacheManager(Config(
                                "meo.comick.pictures",
                                maxNrOfCacheObjects: 10,
                                stalePeriod: const Duration(days: 2),
                              )),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          : _loadingIndicator(),
    );
  }

  Widget _loadingIndicator() {
    return const Center(
        child: SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator()));
  }
}
