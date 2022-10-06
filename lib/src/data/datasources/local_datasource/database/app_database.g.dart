// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CepDao? _cepDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Cep` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `code` TEXT NOT NULL, `state` TEXT NOT NULL, `city` TEXT NOT NULL, `neighborhood` TEXT NOT NULL, `street` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CepDao get cepDao {
    return _cepDaoInstance ??= _$CepDao(database, changeListener);
  }
}

class _$CepDao extends CepDao {
  _$CepDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cepInsertionAdapter = InsertionAdapter(
            database,
            'Cep',
            (Cep item) => <String, Object?>{
                  'id': item.id,
                  'code': item.code,
                  'state': item.state,
                  'city': item.city,
                  'neighborhood': item.neighborhood,
                  'street': item.street
                }),
        _cepDeletionAdapter = DeletionAdapter(
            database,
            'Cep',
            ['id'],
            (Cep item) => <String, Object?>{
                  'id': item.id,
                  'code': item.code,
                  'state': item.state,
                  'city': item.city,
                  'neighborhood': item.neighborhood,
                  'street': item.street
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cep> _cepInsertionAdapter;

  final DeletionAdapter<Cep> _cepDeletionAdapter;

  @override
  Future<List<Cep>> getAllCeps() async {
    return _queryAdapter.queryList('SELECT * FROM Cep',
        mapper: (Map<String, Object?> row) => Cep(
            id: row['id'] as int?,
            code: row['code'] as String,
            state: row['state'] as String,
            city: row['city'] as String,
            neighborhood: row['neighborhood'] as String,
            street: row['street'] as String));
  }

  @override
  Future<Cep?> getCepByCode(String code) async {
    return _queryAdapter.query('Select * FROM Cep WHERE code = ?1',
        mapper: (Map<String, Object?> row) => Cep(
            id: row['id'] as int?,
            code: row['code'] as String,
            state: row['state'] as String,
            city: row['city'] as String,
            neighborhood: row['neighborhood'] as String,
            street: row['street'] as String),
        arguments: [code]);
  }

  @override
  Future<void> insertCep(Cep cep) async {
    await _cepInsertionAdapter.insert(cep, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCep(Cep cep) async {
    await _cepDeletionAdapter.delete(cep);
  }
}
