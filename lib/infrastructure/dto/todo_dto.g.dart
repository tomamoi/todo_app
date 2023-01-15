// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTodoDtoCollection on Isar {
  IsarCollection<TodoDto> get todoDtos => this.collection();
}

const TodoDtoSchema = CollectionSchema(
  name: r'TodoDto',
  id: 8203056221861886331,
  properties: {
    r'createAt': PropertySchema(
      id: 0,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'discription': PropertySchema(
      id: 1,
      name: r'discription',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 2,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 3,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _todoDtoEstimateSize,
  serialize: _todoDtoSerialize,
  deserialize: _todoDtoDeserialize,
  deserializeProp: _todoDtoDeserializeProp,
  idName: r'id',
  indexes: {
    r'createAt': IndexSchema(
      id: -3149045466074267323,
      name: r'createAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isDeleted': IndexSchema(
      id: -786475870904832312,
      name: r'isDeleted',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isDeleted',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _todoDtoGetId,
  getLinks: _todoDtoGetLinks,
  attach: _todoDtoAttach,
  version: '3.0.5',
);

int _todoDtoEstimateSize(
  TodoDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.discription.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _todoDtoSerialize(
  TodoDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createAt);
  writer.writeString(offsets[1], object.discription);
  writer.writeBool(offsets[2], object.isDeleted);
  writer.writeString(offsets[3], object.title);
}

TodoDto _todoDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodoDto(
    createAt: reader.readDateTime(offsets[0]),
    discription: reader.readString(offsets[1]),
    id: id,
    isDeleted: reader.readBool(offsets[2]),
    title: reader.readString(offsets[3]),
  );
  return object;
}

P _todoDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _todoDtoGetId(TodoDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _todoDtoGetLinks(TodoDto object) {
  return [];
}

void _todoDtoAttach(IsarCollection<dynamic> col, Id id, TodoDto object) {
  object.id = id;
}

extension TodoDtoQueryWhereSort on QueryBuilder<TodoDto, TodoDto, QWhere> {
  QueryBuilder<TodoDto, TodoDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhere> anyCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createAt'),
      );
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhere> anyIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isDeleted'),
      );
    });
  }
}

extension TodoDtoQueryWhere on QueryBuilder<TodoDto, TodoDto, QWhereClause> {
  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> createAtEqualTo(
      DateTime createAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createAt',
        value: [createAt],
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> createAtNotEqualTo(
      DateTime createAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createAt',
              lower: [],
              upper: [createAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createAt',
              lower: [createAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createAt',
              lower: [createAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createAt',
              lower: [],
              upper: [createAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> createAtGreaterThan(
    DateTime createAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createAt',
        lower: [createAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> createAtLessThan(
    DateTime createAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createAt',
        lower: [],
        upper: [createAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> createAtBetween(
    DateTime lowerCreateAt,
    DateTime upperCreateAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createAt',
        lower: [lowerCreateAt],
        includeLower: includeLower,
        upper: [upperCreateAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> isDeletedEqualTo(
      bool isDeleted) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isDeleted',
        value: [isDeleted],
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterWhereClause> isDeletedNotEqualTo(
      bool isDeleted) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDeleted',
              lower: [],
              upper: [isDeleted],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDeleted',
              lower: [isDeleted],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDeleted',
              lower: [isDeleted],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isDeleted',
              lower: [],
              upper: [isDeleted],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TodoDtoQueryFilter
    on QueryBuilder<TodoDto, TodoDto, QFilterCondition> {
  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> createAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> createAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> createAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> createAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> discriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discription',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition>
      discriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discription',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> isDeletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension TodoDtoQueryObject
    on QueryBuilder<TodoDto, TodoDto, QFilterCondition> {}

extension TodoDtoQueryLinks
    on QueryBuilder<TodoDto, TodoDto, QFilterCondition> {}

extension TodoDtoQuerySortBy on QueryBuilder<TodoDto, TodoDto, QSortBy> {
  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByDiscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByDiscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension TodoDtoQuerySortThenBy
    on QueryBuilder<TodoDto, TodoDto, QSortThenBy> {
  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByDiscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByDiscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension TodoDtoQueryWhereDistinct
    on QueryBuilder<TodoDto, TodoDto, QDistinct> {
  QueryBuilder<TodoDto, TodoDto, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<TodoDto, TodoDto, QDistinct> distinctByDiscription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discription', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoDto, TodoDto, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<TodoDto, TodoDto, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension TodoDtoQueryProperty
    on QueryBuilder<TodoDto, TodoDto, QQueryProperty> {
  QueryBuilder<TodoDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodoDto, DateTime, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<TodoDto, String, QQueryOperations> discriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discription');
    });
  }

  QueryBuilder<TodoDto, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<TodoDto, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
