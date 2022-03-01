import 'dart:async';
import "package:floor/floor.dart";
import 'package:frontend/dao/postdao.dart';
import 'package:frontend/entity/post_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'post_database.g.dart';

@Database(version: 1, entities: [PostEntity])
abstract class AppDatabase extends FloorDatabase {
  PostDao get postDao;
}     