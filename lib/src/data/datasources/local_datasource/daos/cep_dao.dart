import 'package:floor/floor.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';

@dao
abstract class CepDao {
  @Query('SELECT * FROM ceps')
  Future<List<Cep>> getAllCeps();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCep(Cep cep);

  @delete
  Future<void> deleteCep(Cep cep);
}
