// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_database.dart';

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

  PostDao? _postDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `PostEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `postId` TEXT, `avatar` TEXT, `username` TEXT, `likeCount` TEXT, `postContent` TEXT, `commentCount` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PostDao get postDao {
    return _postDaoInstance ??= _$PostDao(database, changeListener);
  }
}

class _$PostDao extends PostDao {
  _$PostDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _postEntityInsertionAdapter = InsertionAdapter(
            database,
            'PostEntity',
            (PostEntity item) => <String, Object?>{
                  'id': item.id,
                  'postId': item.postId,
                  'avatar': item.avatar,
                  'username': item.username,
                  'likeCount': item.likeCount,
                  'postContent': item.postContent,
                  'commentCount': item.commentCount
                }),
        _postEntityUpdateAdapter = UpdateAdapter(
            database,
            'PostEntity',
            ['id'],
            (PostEntity item) => <String, Object?>{
                  'id': item.id,
                  'postId': item.postId,
                  'avatar': item.avatar,
                  'username': item.username,
                  'likeCount': item.likeCount,
                  'postContent': item.postContent,
                  'commentCount': item.commentCount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PostEntity> _postEntityInsertionAdapter;

  final UpdateAdapter<PostEntity> _postEntityUpdateAdapter;

  @override
  Future<PostEntity?> findPostById(String postId) async {
    return _queryAdapter.query('SELECT * FROM PostEntity WHERE postId = ?1',
        mapper: (Map<String, Object?> row) => PostEntity(
            postId: row['postId'] as String?,
            id: row['id'] as int?,
            avatar: row['avatar'] as String?,
            username: row['username'] as String?,
            likeCount: row['likeCount'] as String?,
            postContent: row['postContent'] as String?,
            commentCount: row['commentCount'] as String?),
        arguments: [postId]);
  }

  @override
  Future<List<PostEntity>> findAllPosts() async {
    return _queryAdapter.queryList('SELECT * FROM PostEntity',
        mapper: (Map<String, Object?> row) => PostEntity(
            postId: row['postId'] as String?,
            id: row['id'] as int?,
            avatar: row['avatar'] as String?,
            username: row['username'] as String?,
            likeCount: row['likeCount'] as String?,
            postContent: row['postContent'] as String?,
            commentCount: row['commentCount'] as String?));
  }

  @override
  Future<List<PostEntity>> deletePosts(String postId) async {
    return _queryAdapter.queryList('DELETE FROM PostEntity WHERE postId = ?1',
        mapper: (Map<String, Object?> row) => PostEntity(
            postId: row['postId'] as String?,
            id: row['id'] as int?,
            avatar: row['avatar'] as String?,
            username: row['username'] as String?,
            likeCount: row['likeCount'] as String?,
            postContent: row['postContent'] as String?,
            commentCount: row['commentCount'] as String?),
        arguments: [postId]);
  }

  @override
  Future<int> insertPost(PostEntity post) {
    return _postEntityInsertionAdapter.insertAndReturnId(
        post, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatePost(PostEntity post) {
    return _postEntityUpdateAdapter.updateAndReturnChangedRows(
        post, OnConflictStrategy.abort);
  }
}
