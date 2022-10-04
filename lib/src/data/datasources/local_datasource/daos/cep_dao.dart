import 'package:floor/floor.dart';
import 'package:konsi_challenge/src/core/utils/constants.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';

@dao
abstract class CepDao {
  @Query('SELECT * FROM ${Constants.cepTableName}')
  Future<List<Cep>> getAllCeps();

  @Query('Select * FROM ${Constants.cepTableName} WHERE id = :id')
  Future<Cep?> getCepById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCep(Cep cep);

  @delete
  Future<void> deleteCep(Cep cep);
}
