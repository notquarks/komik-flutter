import 'package:flutter/semantics.dart';

class SavedComic {
  final String slug;
  final String title;
  final String author;
  final String artist;
  final String desc;
  final int id;
  final String hid;
  final String gpurl;
  final String b2key;

  SavedComic(
      {required this.slug,
      required this.title,
      required this.author,
      required this.artist,
      required this.b2key,
      required this.desc,
      required this.gpurl,
      required this.hid,
      required this.id});
}
