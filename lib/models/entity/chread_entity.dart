import 'package:objectbox/objectbox.dart';

import 'package:komik_flutter/models/entity/comic_entity.dart';

@Entity()
class ChReadEntity {
  @Id(assignable: true)
  late int id;
  late String hid;
  late int comic_id;
  late String comic_hid;
  // late int id;
  // late String hid;
  // late String title;
  late String ch_num;
  late String ch_title;
  // late String cvUrl;

  // late List<String> read;
  // late String slug;
  late DateTime lastRead;
  late final comic = ToOne<ComicEntity>();
  ChReadEntity({
    required this.id,
    required this.hid,
    required this.comic_id,
    required this.comic_hid,
    required this.ch_num,
    required this.ch_title,
    required this.lastRead,
  });
}
