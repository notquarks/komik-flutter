import 'package:komik_flutter/models/entity/chread_entity.dart';
import 'package:komik_flutter/models/entity/library_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ComicEntity {
  @Id(assignable: true)
  late int id;
  late String hid;
  late String title;
  late String slug;
  late String chap;
  late String cvUrl;

  @Backlink('comic')
  late final historys = ToMany<ChReadEntity>();

  late final comics = ToOne<LibraryEntity>();

  ComicEntity({
    required this.id,
    required this.hid,
    required this.title,
    required this.slug,
    required this.chap,
    required this.cvUrl,
  });
}
