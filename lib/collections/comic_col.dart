import 'package:isar/isar.dart';
import 'package:komik_flutter/collections/history_col.dart';
import 'package:komik_flutter/models/lib_comic.dart';

part 'comic_col.g.dart';

@Collection()
class ComicCol {
  @Id()
  late int id;

  late String cvUrl;
  late String chap;
  final history = IsarLinks<History>();

  @Index(unique: true)
  late String slug;
  late String hid;

  @Index(caseSensitive: false, unique: true)
  late String title;
}
