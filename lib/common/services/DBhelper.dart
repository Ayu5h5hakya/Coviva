import 'package:coviva/common/models/post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'posts.db';
  static final _databaseVersion = 1;

  final String _tableName ='posts';
  final String _columnId = 'id';
  final String _columnuserId = 'userId';
  final String _columntitle = 'title';
  final String _columnimageUrl = 'image_url';
  final String _columnuploaderName = 'uploader_name';
  final String _columnuploadTime = 'upload_time';
  final String _columnlikeCount = 'like_count';
  final String _columncommentCount = 'comment_count';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'posts_database.db'),
        onCreate: (db, version) {
      return db.execute(
          '''CREATE TABLE $_tableName(
             $_columnId INTEGER PRIMARY KEY,
             $_columnuserId INTEGER,
             $_columntitle TEXT NOT NULL,
             $_columnimageUrl TEXT,
             $_columnuploaderName TEXT NOT NULL,
             $_columnuploadTime TEXT NOT NULL,
             $_columnlikeCount INTEGER NOT NULL,
             $_columncommentCount INTEGER NOT NULL
             )''');
    }, version: 1);
  }

  Future<PostResponse> getPostFromDB() async {
    final Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('posts');
    List<Post> posts = List.generate(maps.length, (i) {
      return Post(
          id: maps[i][_columnId],
          userId: maps[i][_columnuserId],
          commentCount: maps[i][_columncommentCount],
          imageUrl: maps[i][_columnimageUrl],
          likeCount: maps[i][_columnlikeCount],
          title: maps[i][_columntitle],
          uploaderName: maps[i][_columnuploaderName],
          uploadTime: maps[i][_columnuploadTime]);
    });
    return PostResponse(posts: posts);
  }

   Future<void> insert(Post post) async {
        Database db = await database;
        await db.insert('posts', post.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }

}
