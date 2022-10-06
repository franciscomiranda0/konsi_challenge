import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/data/models/cep_model.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';

abstract class CepRepositoryInterface {
  Future<DataState<CepModel>> getCepData(String code);
  Future<List<Cep>> getAllCeps();
  Future<Cep?> getCepByCode(String code);
  Future<void> saveCep(Cep cep);
  Future<void> eraseCep(Cep cep);
}
