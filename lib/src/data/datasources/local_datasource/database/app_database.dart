import 'dart:async';
import 'package:floor/floor.dart';
import 'package:konsi_challenge/src/data/datasources/local_datasource/daos/cep_dao.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Cep])
abstract class AppDatabase extends FloorDatabase {
  CepDao get cepDao;
}
