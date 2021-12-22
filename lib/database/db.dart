import 'package:movieapp/model/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

class DB {
  static const DATABASE_NAME = 'bookmark.db';
  static const DATABASE_VERSION = 1;
  static const TABLE_NAME_MOVIE = 'tb_movie';

  // DB._();
  // static final DB db = DB._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String databasePath = await getDatabasesPath();
    return await openDatabase(
      join(databasePath, DATABASE_NAME),
      version: DATABASE_VERSION,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $TABLE_NAME_MOVIE (        
                id INTEGER,                   
                popularity NUM,  
                title TEXT,
                backdrop_path TEXT,
                poster_path TEXT,
                overview TEXT,
                vote_average NUM,
              )
        ''');
      },
    );
  }

  Future<List<Movie>> getAllMovie() async {
    final db = await database;
    var movies = await db.query(TABLE_NAME_MOVIE, columns: [
      "id",
      "popularity",
      "title",
      "backdrop_path",
      "poster_path",
      "overview",
      "vote_average",
    ]);

    List<Movie> listMovies = [];
    movies.forEach(
      (element) {
        listMovies.add(Movie.fromJson(element));
      },
    );
    return listMovies;
  }

  Future<int> insertMovie(Movie movies) async {
    final db = await database;
    return await db.insert(TABLE_NAME_MOVIE, movies.tojson());
  }

  Future<int> deleteWhereIdMovie(int id) async {
    final db = await database;
    return await db.delete(
      TABLE_NAME_MOVIE,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<bool> cekmovie(int id) async {
    final db = await database;
    var Movies = await db.query(
      TABLE_NAME_MOVIE,
      columns: [
        "id",
        "popularity",
        "title",
        "backdrop_path",
        "poster_path",
        "overview",
        "vote_average",
      ],
      where: 'id=?',
      whereArgs: [id],
    );
    //untuk mengecek data
    if (Movies.length > 0) {
      return true;
    } else {
      return false;
    }
  }
}
