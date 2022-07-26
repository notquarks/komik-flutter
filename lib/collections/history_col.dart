import 'package:isar/isar.dart';

part 'history_col.g.dart';

@Collection()
class History {
  @Id()
  late int id;

  late String chapter_title;
  late String cvUrl;
  late int ch_id;
  late List<String> read;
  late String slug;

  @Index(composite: [CompositeIndex('title')])
  late DateTime lastRead;

  @Index(unique: true)
  late String hid;

  @Index(caseSensitive: false)
  late String title;
}
