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

class _ReadPageState extends State<ReadPage>
    with SingleTickerProviderStateMixin {
  List<DetailsComic> detailsComic = <DetailsComic>[];
  TapDownDetails? tapDownDetails;
  late TransformationController _transformationController;
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  @override
  void initState() {
    _fetchData(widget.hid);
    _transformationController = TransformationController();
    _scrollController;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        _transformationController.value = _animation!.value;
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _transformationController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
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
          ? CustomScrollView(slivers: [
              SliverAppBar(
                title: Text(
                    'Ch. ${widget.ch} ${widget.title == 'null' ? '' : widget.title}'),
                floating: true,
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
                ],
              ),
              SliverFillRemaining(
                child: GestureDetector(
                  onDoubleTapDown: ((details) => tapDownDetails = details),
                  onDoubleTap: () {
                    final position = tapDownDetails!.localPosition;
                    final double scale = 3;
                    final x = -position.dx * (scale - 1);
                    final y = -position.dy * (scale - 1);
                    final zoomed = Matrix4.identity()
                      ..translate(x, y)
                      ..scale(scale);
                    final end = _transformationController.value.isIdentity()
                        ? zoomed
                        : Matrix4.identity();
                    _animation = Matrix4Tween(
                            begin: _transformationController.value, end: end)
                        .animate(CurveTween(curve: Curves.easeOut)
                            .animate(_animationController));
                    _animationController.forward(from: 0);
                  },
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 7,
                    radius: Radius.circular(10),
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      panEnabled: true,
                      scaleEnabled: false,
                      clipBehavior: Clip.none,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: detailsComic.first.chapter.mdImages.length,
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitWidth,
                            maxWidthDiskCache:
                                (MediaQuery.of(context).size.width * 1.05)
                                    .toInt(),
                            imageUrl:
                                'https://meo.comick.pictures/${detailsComic.first.chapter.mdImages[index].b2Key}',
                            progressIndicatorBuilder:
                                (context, url, progress) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 180),
                              child: Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ])
          : _loadingIndicator(),
    );
  }

  Widget _loadingIndicator() {
    return const Center(
        child: SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator()));
  }
}
