// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_col.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetHistoryCollection on Isar {
  IsarCollection<History> get historys => getCollection();
}

const HistorySchema = CollectionSchema(
  name: 'History',
  schema:
      '{"name":"History","idName":"id","properties":[{"name":"ch_id","type":"Long"},{"name":"chapter_title","type":"String"},{"name":"cvUrl","type":"String"},{"name":"hid","type":"String"},{"name":"lastRead","type":"Long"},{"name":"read","type":"StringList"},{"name":"slug","type":"String"},{"name":"title","type":"String"}],"indexes":[{"name":"hid","unique":true,"properties":[{"name":"hid","type":"Hash","caseSensitive":true}]},{"name":"lastRead_title","unique":false,"properties":[{"name":"lastRead","type":"Value","caseSensitive":false},{"name":"title","type":"Hash","caseSensitive":true}]},{"name":"title","unique":false,"properties":[{"name":"title","type":"Hash","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'ch_id': 0,
    'chapter_title': 1,
    'cvUrl': 2,
    'hid': 3,
    'lastRead': 4,
    'read': 5,
    'slug': 6,
    'title': 7
  },
  listProperties: {'read'},
  indexIds: {'hid': 0, 'lastRead_title': 1, 'title': 2},
  indexValueTypes: {
    'hid': [
      IndexValueType.stringHash,
    ],
    'lastRead_title': [
      IndexValueType.long,
      IndexValueType.stringHash,
    ],
    'title': [
      IndexValueType.stringHashCIS,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _historyGetId,
  setId: _historySetId,
  getLinks: _historyGetLinks,
  attachLinks: _historyAttachLinks,
  serializeNative: _historySerializeNative,
  deserializeNative: _historyDeserializeNative,
  deserializePropNative: _historyDeserializePropNative,
  serializeWeb: _historySerializeWeb,
  deserializeWeb: _historyDeserializeWeb,
  deserializePropWeb: _historyDeserializePropWeb,
  version: 3,
);

int? _historyGetId(History object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _historySetId(History object, int id) {
  object.id = id;
}

List<IsarLinkBase> _historyGetLinks(History object) {
  return [];
}

void _historySerializeNative(
    IsarCollection<History> collection,
    IsarRawObject rawObj,
    History object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.ch_id;
  final _ch_id = value0;
  final value1 = object.chapter_title;
  final _chapter_title = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_chapter_title.length) as int;
  final value2 = object.cvUrl;
  final _cvUrl = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_cvUrl.length) as int;
  final value3 = object.hid;
  final _hid = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_hid.length) as int;
  final value4 = object.lastRead;
  final _lastRead = value4;
  final value5 = object.read;
  dynamicSize += (value5.length) * 8;
  final bytesList5 = <IsarUint8List>[];
  for (var str in value5) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList5.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _read = bytesList5;
  final value6 = object.slug;
  final _slug = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_slug.length) as int;
  final value7 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _ch_id);
  writer.writeBytes(offsets[1], _chapter_title);
  writer.writeBytes(offsets[2], _cvUrl);
  writer.writeBytes(offsets[3], _hid);
  writer.writeDateTime(offsets[4], _lastRead);
  writer.writeStringList(offsets[5], _read);
  writer.writeBytes(offsets[6], _slug);
  writer.writeBytes(offsets[7], _title);
}

History _historyDeserializeNative(IsarCollection<History> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = History();
  object.ch_id = reader.readLong(offsets[0]);
  object.chapter_title = reader.readString(offsets[1]);
  object.cvUrl = reader.readString(offsets[2]);
  object.hid = reader.readString(offsets[3]);
  object.id = id;
  object.lastRead = reader.readDateTime(offsets[4]);
  object.read = reader.readStringList(offsets[5]) ?? [];
  object.slug = reader.readString(offsets[6]);
  object.title = reader.readString(offsets[7]);
  return object;
}

P _historyDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _historySerializeWeb(
    IsarCollection<History> collection, History object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'ch_id', object.ch_id);
  IsarNative.jsObjectSet(jsObj, 'chapter_title', object.chapter_title);
  IsarNative.jsObjectSet(jsObj, 'cvUrl', object.cvUrl);
  IsarNative.jsObjectSet(jsObj, 'hid', object.hid);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(
      jsObj, 'lastRead', object.lastRead.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'read', object.read);
  IsarNative.jsObjectSet(jsObj, 'slug', object.slug);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

History _historyDeserializeWeb(
    IsarCollection<History> collection, dynamic jsObj) {
  final object = History();
  object.ch_id =
      IsarNative.jsObjectGet(jsObj, 'ch_id') ?? double.negativeInfinity;
  object.chapter_title = IsarNative.jsObjectGet(jsObj, 'chapter_title') ?? '';
  object.cvUrl = IsarNative.jsObjectGet(jsObj, 'cvUrl') ?? '';
  object.hid = IsarNative.jsObjectGet(jsObj, 'hid') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.lastRead = IsarNative.jsObjectGet(jsObj, 'lastRead') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'lastRead'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.read = (IsarNative.jsObjectGet(jsObj, 'read') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.slug = IsarNative.jsObjectGet(jsObj, 'slug') ?? '';
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  return object;
}

P _historyDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'ch_id':
      return (IsarNative.jsObjectGet(jsObj, 'ch_id') ?? double.negativeInfinity)
          as P;
    case 'chapter_title':
      return (IsarNative.jsObjectGet(jsObj, 'chapter_title') ?? '') as P;
    case 'cvUrl':
      return (IsarNative.jsObjectGet(jsObj, 'cvUrl') ?? '') as P;
    case 'hid':
      return (IsarNative.jsObjectGet(jsObj, 'hid') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'lastRead':
      return (IsarNative.jsObjectGet(jsObj, 'lastRead') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'lastRead'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'read':
      return ((IsarNative.jsObjectGet(jsObj, 'read') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'slug':
      return (IsarNative.jsObjectGet(jsObj, 'slug') ?? '') as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _historyAttachLinks(IsarCollection col, int id, History object) {}

extension HistoryByIndex on IsarCollection<History> {
  Future<History?> getByHid(String hid) {
    return getByIndex('hid', [hid]);
  }

  History? getByHidSync(String hid) {
    return getByIndexSync('hid', [hid]);
  }

  Future<bool> deleteByHid(String hid) {
    return deleteByIndex('hid', [hid]);
  }

  bool deleteByHidSync(String hid) {
    return deleteByIndexSync('hid', [hid]);
  }

  Future<List<History?>> getAllByHid(List<String> hidValues) {
    final values = hidValues.map((e) => [e]).toList();
    return getAllByIndex('hid', values);
  }

  List<History?> getAllByHidSync(List<String> hidValues) {
    final values = hidValues.map((e) => [e]).toList();
    return getAllByIndexSync('hid', values);
  }

  Future<int> deleteAllByHid(List<String> hidValues) {
    final values = hidValues.map((e) => [e]).toList();
    return deleteAllByIndex('hid', values);
  }

  int deleteAllByHidSync(List<String> hidValues) {
    final values = hidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('hid', values);
  }
}

extension HistoryQueryWhereSort on QueryBuilder<History, History, QWhere> {
  QueryBuilder<History, History, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<History, History, QAfterWhere> anyHid() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'hid'));
  }

  QueryBuilder<History, History, QAfterWhere> anyLastReadTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'lastRead_title'));
  }

  QueryBuilder<History, History, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'title'));
  }
}

extension HistoryQueryWhere on QueryBuilder<History, History, QWhereClause> {
  QueryBuilder<History, History, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<History, History, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<History, History, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<History, History, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> hidEqualTo(String hid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'hid',
      value: [hid],
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> hidNotEqualTo(String hid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'hid',
        upper: [hid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'hid',
        lower: [hid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'hid',
        lower: [hid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'hid',
        upper: [hid],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadEqualTo(
      DateTime lastRead) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'lastRead_title',
      value: [lastRead],
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadNotEqualTo(
      DateTime lastRead) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lastRead_title',
        upper: [lastRead],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lastRead_title',
        lower: [lastRead],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lastRead_title',
        lower: [lastRead],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lastRead_title',
        upper: [lastRead],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadGreaterThan(
    DateTime lastRead, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'lastRead_title',
      lower: [lastRead],
      includeLower: include,
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadLessThan(
    DateTime lastRead, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'lastRead_title',
      upper: [lastRead],
      includeUpper: include,
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadBetween(
    DateTime lowerLastRead,
    DateTime upperLastRead, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'lastRead_title',
      lower: [lowerLastRead],
      includeLower: includeLower,
      upper: [upperLastRead],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadTitleEqualTo(
      DateTime lastRead, String title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'lastRead_title',
      value: [lastRead, title],
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> lastReadTitleNotEqualTo(
      DateTime lastRead, String title) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lastRead_title',
        upper: [lastRead, title],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lastRead_title',
        lower: [lastRead, title],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lastRead_title',
        lower: [lastRead, title],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lastRead_title',
        upper: [lastRead, title],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<History, History, QAfterWhereClause> titleEqualTo(String title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'title',
      value: [title],
    ));
  }

  QueryBuilder<History, History, QAfterWhereClause> titleNotEqualTo(
      String title) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'title',
        upper: [title],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'title',
        lower: [title],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'title',
        lower: [title],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'title',
        upper: [title],
        includeUpper: false,
      ));
    }
  }
}

extension HistoryQueryFilter
    on QueryBuilder<History, History, QFilterCondition> {
  QueryBuilder<History, History, QAfterFilterCondition> ch_idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'ch_id',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> ch_idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'ch_id',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> ch_idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'ch_id',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> ch_idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'ch_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chapter_title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition>
      chapter_titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chapter_title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chapter_title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chapter_title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chapter_title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chapter_title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chapter_title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> chapter_titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chapter_title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cvUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> cvUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cvUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> hidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> lastReadEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastRead',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> lastReadGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastRead',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> lastReadLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastRead',
      value: value,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> lastReadBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastRead',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'read',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'read',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'read',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'read',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'read',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'read',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'read',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> readAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'read',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'slug',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> slugMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'slug',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<History, History, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension HistoryQueryLinks
    on QueryBuilder<History, History, QFilterCondition> {}

extension HistoryQueryWhereSortBy on QueryBuilder<History, History, QSortBy> {
  QueryBuilder<History, History, QAfterSortBy> sortByCh_id() {
    return addSortByInternal('ch_id', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByCh_idDesc() {
    return addSortByInternal('ch_id', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByChapter_title() {
    return addSortByInternal('chapter_title', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByChapter_titleDesc() {
    return addSortByInternal('chapter_title', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByCvUrl() {
    return addSortByInternal('cvUrl', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByCvUrlDesc() {
    return addSortByInternal('cvUrl', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByHid() {
    return addSortByInternal('hid', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByHidDesc() {
    return addSortByInternal('hid', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByLastRead() {
    return addSortByInternal('lastRead', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByLastReadDesc() {
    return addSortByInternal('lastRead', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortBySlug() {
    return addSortByInternal('slug', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortBySlugDesc() {
    return addSortByInternal('slug', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension HistoryQueryWhereSortThenBy
    on QueryBuilder<History, History, QSortThenBy> {
  QueryBuilder<History, History, QAfterSortBy> thenByCh_id() {
    return addSortByInternal('ch_id', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByCh_idDesc() {
    return addSortByInternal('ch_id', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByChapter_title() {
    return addSortByInternal('chapter_title', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByChapter_titleDesc() {
    return addSortByInternal('chapter_title', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByCvUrl() {
    return addSortByInternal('cvUrl', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByCvUrlDesc() {
    return addSortByInternal('cvUrl', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByHid() {
    return addSortByInternal('hid', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByHidDesc() {
    return addSortByInternal('hid', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByLastRead() {
    return addSortByInternal('lastRead', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByLastReadDesc() {
    return addSortByInternal('lastRead', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenBySlug() {
    return addSortByInternal('slug', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenBySlugDesc() {
    return addSortByInternal('slug', Sort.desc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<History, History, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension HistoryQueryWhereDistinct
    on QueryBuilder<History, History, QDistinct> {
  QueryBuilder<History, History, QDistinct> distinctByCh_id() {
    return addDistinctByInternal('ch_id');
  }

  QueryBuilder<History, History, QDistinct> distinctByChapter_title(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chapter_title', caseSensitive: caseSensitive);
  }

  QueryBuilder<History, History, QDistinct> distinctByCvUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('cvUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<History, History, QDistinct> distinctByHid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hid', caseSensitive: caseSensitive);
  }

  QueryBuilder<History, History, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<History, History, QDistinct> distinctByLastRead() {
    return addDistinctByInternal('lastRead');
  }

  QueryBuilder<History, History, QDistinct> distinctBySlug(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('slug', caseSensitive: caseSensitive);
  }

  QueryBuilder<History, History, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension HistoryQueryProperty
    on QueryBuilder<History, History, QQueryProperty> {
  QueryBuilder<History, int, QQueryOperations> ch_idProperty() {
    return addPropertyNameInternal('ch_id');
  }

  QueryBuilder<History, String, QQueryOperations> chapter_titleProperty() {
    return addPropertyNameInternal('chapter_title');
  }

  QueryBuilder<History, String, QQueryOperations> cvUrlProperty() {
    return addPropertyNameInternal('cvUrl');
  }

  QueryBuilder<History, String, QQueryOperations> hidProperty() {
    return addPropertyNameInternal('hid');
  }

  QueryBuilder<History, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<History, DateTime, QQueryOperations> lastReadProperty() {
    return addPropertyNameInternal('lastRead');
  }

  QueryBuilder<History, List<String>, QQueryOperations> readProperty() {
    return addPropertyNameInternal('read');
  }

  QueryBuilder<History, String, QQueryOperations> slugProperty() {
    return addPropertyNameInternal('slug');
  }

  QueryBuilder<History, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
