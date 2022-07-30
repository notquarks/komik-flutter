import 'package:objectbox/objectbox.dart';

import 'package:komik_flutter/models/entity/chread_entity.dart';

@Entity()
class RecentEntity {
  @Id(assignable: true)
  late int id;
  final history = ToOne<ChReadEntity>();
  RecentEntity({
    required this.id,
  });
}
