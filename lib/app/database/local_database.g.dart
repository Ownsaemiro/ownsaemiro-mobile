// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $RecentSearchTable extends RecentSearch
    with TableInfo<$RecentSearchTable, RecentSearchData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentSearchTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keywordMeta =
      const VerificationMeta('keyword');
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>(
      'keyword', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [id, keyword, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recent_search';
  @override
  VerificationContext validateIntegrity(Insertable<RecentSearchData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('keyword')) {
      context.handle(_keywordMeta,
          keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta));
    } else if (isInserting) {
      context.missing(_keywordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecentSearchData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentSearchData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      keyword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keyword'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $RecentSearchTable createAlias(String alias) {
    return $RecentSearchTable(attachedDatabase, alias);
  }
}

class RecentSearchData extends DataClass
    implements Insertable<RecentSearchData> {
  final int id;
  final String keyword;
  final DateTime createdAt;
  const RecentSearchData(
      {required this.id, required this.keyword, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['keyword'] = Variable<String>(keyword);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RecentSearchCompanion toCompanion(bool nullToAbsent) {
    return RecentSearchCompanion(
      id: Value(id),
      keyword: Value(keyword),
      createdAt: Value(createdAt),
    );
  }

  factory RecentSearchData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentSearchData(
      id: serializer.fromJson<int>(json['id']),
      keyword: serializer.fromJson<String>(json['keyword']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'keyword': serializer.toJson<String>(keyword),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RecentSearchData copyWith({int? id, String? keyword, DateTime? createdAt}) =>
      RecentSearchData(
        id: id ?? this.id,
        keyword: keyword ?? this.keyword,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('RecentSearchData(')
          ..write('id: $id, ')
          ..write('keyword: $keyword, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, keyword, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentSearchData &&
          other.id == this.id &&
          other.keyword == this.keyword &&
          other.createdAt == this.createdAt);
}

class RecentSearchCompanion extends UpdateCompanion<RecentSearchData> {
  final Value<int> id;
  final Value<String> keyword;
  final Value<DateTime> createdAt;
  const RecentSearchCompanion({
    this.id = const Value.absent(),
    this.keyword = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RecentSearchCompanion.insert({
    this.id = const Value.absent(),
    required String keyword,
    this.createdAt = const Value.absent(),
  }) : keyword = Value(keyword);
  static Insertable<RecentSearchData> custom({
    Expression<int>? id,
    Expression<String>? keyword,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (keyword != null) 'keyword': keyword,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RecentSearchCompanion copyWith(
      {Value<int>? id, Value<String>? keyword, Value<DateTime>? createdAt}) {
    return RecentSearchCompanion(
      id: id ?? this.id,
      keyword: keyword ?? this.keyword,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentSearchCompanion(')
          ..write('id: $id, ')
          ..write('keyword: $keyword, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  _$LocalDatabaseManager get managers => _$LocalDatabaseManager(this);
  late final $RecentSearchTable recentSearch = $RecentSearchTable(this);
  late final RecentSearchDao recentSearchDao =
      RecentSearchDao(this as LocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recentSearch];
}

typedef $$RecentSearchTableInsertCompanionBuilder = RecentSearchCompanion
    Function({
  Value<int> id,
  required String keyword,
  Value<DateTime> createdAt,
});
typedef $$RecentSearchTableUpdateCompanionBuilder = RecentSearchCompanion
    Function({
  Value<int> id,
  Value<String> keyword,
  Value<DateTime> createdAt,
});

class $$RecentSearchTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $RecentSearchTable,
    RecentSearchData,
    $$RecentSearchTableFilterComposer,
    $$RecentSearchTableOrderingComposer,
    $$RecentSearchTableProcessedTableManager,
    $$RecentSearchTableInsertCompanionBuilder,
    $$RecentSearchTableUpdateCompanionBuilder> {
  $$RecentSearchTableTableManager(_$LocalDatabase db, $RecentSearchTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RecentSearchTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RecentSearchTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$RecentSearchTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> keyword = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RecentSearchCompanion(
            id: id,
            keyword: keyword,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String keyword,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RecentSearchCompanion.insert(
            id: id,
            keyword: keyword,
            createdAt: createdAt,
          ),
        ));
}

class $$RecentSearchTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDatabase,
    $RecentSearchTable,
    RecentSearchData,
    $$RecentSearchTableFilterComposer,
    $$RecentSearchTableOrderingComposer,
    $$RecentSearchTableProcessedTableManager,
    $$RecentSearchTableInsertCompanionBuilder,
    $$RecentSearchTableUpdateCompanionBuilder> {
  $$RecentSearchTableProcessedTableManager(super.$state);
}

class $$RecentSearchTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $RecentSearchTable> {
  $$RecentSearchTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get keyword => $state.composableBuilder(
      column: $state.table.keyword,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RecentSearchTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $RecentSearchTable> {
  $$RecentSearchTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get keyword => $state.composableBuilder(
      column: $state.table.keyword,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$LocalDatabaseManager {
  final _$LocalDatabase _db;
  _$LocalDatabaseManager(this._db);
  $$RecentSearchTableTableManager get recentSearch =>
      $$RecentSearchTableTableManager(_db, _db.recentSearch);
}
