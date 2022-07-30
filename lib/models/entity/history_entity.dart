import 'package:objectbox/objectbox.dart';

import 'package:komik_flutter/models/entity/chread_entity.dart';

@Entity()
class HistoryEntity {
  @Id(assignable: true)
  late int id;
  final history = ToOne<ChReadEntity>();
  HistoryEntity({
    required this.id,
  });
}
