import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/data/models/cep_model.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';

abstract class CepRepositoryInterface {
  Future<DataState<CepModel>> getCepByCode(String code);
  Future<List<Cep>> getAllCeps();
  Future<Cep?> getCepById(int id);
  Future<void> saveCep(Cep cep);
  Future<void> eraseCep(Cep cep);
}
