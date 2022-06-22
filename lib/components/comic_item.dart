import 'package:flutter/material.dart';
import 'package:komik_flutter/models/lib_comic.dart';

class ComicListItem extends StatelessWidget {
  const ComicListItem({Key? key, required this.comic}) : super(key: key);
  final LibComic comic;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(comic.mdComics.title),
    );
  }
}
