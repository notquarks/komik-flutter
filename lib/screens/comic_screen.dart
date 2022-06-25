import 'package:flutter/material.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComicPage extends ConsumerStatefulWidget {
  ComicPage({Key? key, required this.comic, required this.hid})
      : super(key: key);
  LibComic comic;
  String hid;

  @override
  ConsumerState<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends ConsumerState<ComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(widget.comic.mdComics.title),
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(children: [
              Text('tes'),
              Text(widget.hid),
            ]),
          ),
        ),
      ]),
    );
  }
}
