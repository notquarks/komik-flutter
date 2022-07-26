// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_col.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetComicColCollection on Isar {
  IsarCollection<ComicCol> get comicCols => getCollection();
}

const ComicColSchema = CollectionSchema(
  name: 'ComicCol',
  schema:
      '{"name":"ComicCol","idName":"id","properties":[{"name":"chap","type":"String"},{"name":"cvUrl","type":"String"},{"name":"hid","type":"String"},{"name":"slug","type":"String"},{"name":"title","type":"String"}],"indexes":[{"name":"slug","unique":true,"properties":[{"name":"slug","type":"Hash","caseSensitive":true}]},{"name":"title","unique":true,"properties":[{"name":"title","type":"Hash","caseSensitive":false}]}],"links":[{"name":"history","target":"History"}]}',
  idName: 'id',
  propertyIds: {'chap': 0, 'cvUrl': 1, 'hid': 2, 'slug': 3, 'title': 4},
  listProperties: {},
  indexIds: {'slug': 0, 'title': 1},
  indexValueTypes: {
    'slug': [
      IndexValueType.stringHash,
    ],
    'title': [
      IndexValueType.stringHashCIS,
    ]
  },
  linkIds: {'history': 0},
  backlinkLinkNames: {},
  getId: _comicColGetId,
  setId: _comicColSetId,
  getLinks: _comicColGetLinks,
  attachLinks: _comicColAttachLinks,
  serializeNative: _comicColSerializeNative,
  deserializeNative: _comicColDeserializeNative,
  deserializePropNative: _comicColDeserializePropNative,
  serializeWeb: _comicColSerializeWeb,
  deserializeWeb: _comicColDeserializeWeb,
  deserializePropWeb: _comicColDeserializePropWeb,
  version: 3,
);

int? _comicColGetId(ComicCol object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _comicColSetId(ComicCol object, int id) {
  object.id = id;
}

List<IsarLinkBase> _comicColGetLinks(ComicCol object) {
  return [object.history];
}

void _comicColSerializeNative(
    IsarCollection<ComicCol> collection,
    IsarRawObject rawObj,
    ComicCol object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.chap;
  final _chap = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_chap.length) as int;
  final value1 = object.cvUrl;
  final _cvUrl = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_cvUrl.length) as int;
  final value2 = object.hid;
  final _hid = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_hid.length) as int;
  final value3 = object.slug;
  final _slug = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_slug.length) as int;
  final value4 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _chap);
  writer.writeBytes(offsets[1], _cvUrl);
  writer.writeBytes(offsets[2], _hid);
  writer.writeBytes(offsets[3], _slug);
  writer.writeBytes(offsets[4], _title);
}

ComicCol _comicColDeserializeNative(IsarCollection<ComicCol> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = ComicCol();
  object.chap = reader.readString(offsets[0]);
  object.cvUrl = reader.readString(offsets[1]);
  object.hid = reader.readString(offsets[2]);
  object.id = id;
  object.slug = reader.readString(offsets[3]);
  object.title = reader.readString(offsets[4]);
  _comicColAttachLinks(collection, id, object);
  return object;
}

P _comicColDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _comicColSerializeWeb(
    IsarCollection<ComicCol> collection, ComicCol object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'chap', object.chap);
  IsarNative.jsObjectSet(jsObj, 'cvUrl', object.cvUrl);
  IsarNative.jsObjectSet(jsObj, 'hid', object.hid);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'slug', object.slug);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

ComicCol _comicColDeserializeWeb(
    IsarCollection<ComicCol> collection, dynamic jsObj) {
  final object = ComicCol();
  object.chap = IsarNative.jsObjectGet(jsObj, 'chap') ?? '';
  object.cvUrl = IsarNative.jsObjectGet(jsObj, 'cvUrl') ?? '';
  object.hid = IsarNative.jsObjectGet(jsObj, 'hid') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.slug = IsarNative.jsObjectGet(jsObj, 'slug') ?? '';
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  _comicColAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _comicColDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'chap':
      return (IsarNative.jsObjectGet(jsObj, 'chap') ?? '') as P;
    case 'cvUrl':
      return (IsarNative.jsObjectGet(jsObj, 'cvUrl') ?? '') as P;
    case 'hid':
      return (IsarNative.jsObjectGet(jsObj, 'hid') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'slug':
      return (IsarNative.jsObjectGet(jsObj, 'slug') ?? '') as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _comicColAttachLinks(IsarCollection col, int id, ComicCol object) {
  object.history.attach(col, col.isar.historys, 'history', id);
}

extension ComicColByIndex on IsarCollection<ComicCol> {
  Future<ComicCol?> getBySlug(String slug) {
    return getByIndex('slug', [slug]);
  }

  ComicCol? getBySlugSync(String slug) {
    return getByIndexSync('slug', [slug]);
  }

  Future<bool> deleteBySlug(String slug) {
    return deleteByIndex('slug', [slug]);
  }

  bool deleteBySlugSync(String slug) {
    return deleteByIndexSync('slug', [slug]);
  }

  Future<List<ComicCol?>> getAllBySlug(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return getAllByIndex('slug', values);
  }

  List<ComicCol?> getAllBySlugSync(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return getAllByIndexSync('slug', values);
  }

  Future<int> deleteAllBySlug(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return deleteAllByIndex('slug', values);
  }

  int deleteAllBySlugSync(List<String> slugValues) {
    final values = slugValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('slug', values);
  }

  Future<ComicCol?> getByTitle(String title) {
    return getByIndex('title', [title]);
  }

  ComicCol? getByTitleSync(String title) {
    return getByIndexSync('title', [title]);
  }

  Future<bool> deleteByTitle(String title) {
    return deleteByIndex('title', [title]);
  }

  bool deleteByTitleSync(String title) {
    return deleteByIndexSync('title', [title]);
  }

  Future<List<ComicCol?>> getAllByTitle(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return getAllByIndex('title', values);
  }

  List<ComicCol?> getAllByTitleSync(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return getAllByIndexSync('title', values);
  }

  Future<int> deleteAllByTitle(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return deleteAllByIndex('title', values);
  }

  int deleteAllByTitleSync(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('title', values);
  }
}

extension ComicColQueryWhereSort on QueryBuilder<ComicCol, ComicCol, QWhere> {
  QueryBuilder<ComicCol, ComicCol, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhere> anySlug() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'slug'));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'title'));
  }
}

extension ComicColQueryWhere on QueryBuilder<ComicCol, ComicCol, QWhereClause> {
  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> idBetween(
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

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> slugEqualTo(String slug) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'slug',
      value: [slug],
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> slugNotEqualTo(
      String slug) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'slug',
        upper: [slug],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'slug',
        lower: [slug],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'slug',
        lower: [slug],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'slug',
        upper: [slug],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> titleEqualTo(
      String title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'title',
      value: [title],
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterWhereClause> titleNotEqualTo(
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

extension ComicColQueryFilter
    on QueryBuilder<ComicCol, ComicCol, QFilterCondition> {
  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chap',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chap',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chap',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chap',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'chap',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'chap',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'chap',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> chapMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'chap',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlEqualTo(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlGreaterThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlLessThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlBetween(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlStartsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlEndsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cvUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> cvUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cvUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidEqualTo(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidGreaterThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidLessThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidBetween(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidStartsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidEndsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> hidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugEqualTo(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugGreaterThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugLessThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugBetween(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugStartsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugEndsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'slug',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> slugMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'slug',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> titleMatches(
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

extension ComicColQueryLinks
    on QueryBuilder<ComicCol, ComicCol, QFilterCondition> {
  QueryBuilder<ComicCol, ComicCol, QAfterFilterCondition> history(
      FilterQuery<History> q) {
    return linkInternal(
      isar.historys,
      q,
      'history',
    );
  }
}

extension ComicColQueryWhereSortBy
    on QueryBuilder<ComicCol, ComicCol, QSortBy> {
  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByChap() {
    return addSortByInternal('chap', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByChapDesc() {
    return addSortByInternal('chap', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByCvUrl() {
    return addSortByInternal('cvUrl', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByCvUrlDesc() {
    return addSortByInternal('cvUrl', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByHid() {
    return addSortByInternal('hid', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByHidDesc() {
    return addSortByInternal('hid', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortBySlug() {
    return addSortByInternal('slug', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortBySlugDesc() {
    return addSortByInternal('slug', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension ComicColQueryWhereSortThenBy
    on QueryBuilder<ComicCol, ComicCol, QSortThenBy> {
  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByChap() {
    return addSortByInternal('chap', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByChapDesc() {
    return addSortByInternal('chap', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByCvUrl() {
    return addSortByInternal('cvUrl', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByCvUrlDesc() {
    return addSortByInternal('cvUrl', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByHid() {
    return addSortByInternal('hid', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByHidDesc() {
    return addSortByInternal('hid', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenBySlug() {
    return addSortByInternal('slug', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenBySlugDesc() {
    return addSortByInternal('slug', Sort.desc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<ComicCol, ComicCol, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension ComicColQueryWhereDistinct
    on QueryBuilder<ComicCol, ComicCol, QDistinct> {
  QueryBuilder<ComicCol, ComicCol, QDistinct> distinctByChap(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('chap', caseSensitive: caseSensitive);
  }

  QueryBuilder<ComicCol, ComicCol, QDistinct> distinctByCvUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('cvUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<ComicCol, ComicCol, QDistinct> distinctByHid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hid', caseSensitive: caseSensitive);
  }

  QueryBuilder<ComicCol, ComicCol, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ComicCol, ComicCol, QDistinct> distinctBySlug(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('slug', caseSensitive: caseSensitive);
  }

  QueryBuilder<ComicCol, ComicCol, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension ComicColQueryProperty
    on QueryBuilder<ComicCol, ComicCol, QQueryProperty> {
  QueryBuilder<ComicCol, String, QQueryOperations> chapProperty() {
    return addPropertyNameInternal('chap');
  }

  QueryBuilder<ComicCol, String, QQueryOperations> cvUrlProperty() {
    return addPropertyNameInternal('cvUrl');
  }

  QueryBuilder<ComicCol, String, QQueryOperations> hidProperty() {
    return addPropertyNameInternal('hid');
  }

  QueryBuilder<ComicCol, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ComicCol, String, QQueryOperations> slugProperty() {
    return addPropertyNameInternal('slug');
  }

  QueryBuilder<ComicCol, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
