import 'package:komik_flutter/models/entity/comic_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LibraryEntity {
  @Id(assignable: true)
  late int id;

  late final comic = ToOne<ComicEntity>();

  LibraryEntity({
    required this.id,
  });
}
