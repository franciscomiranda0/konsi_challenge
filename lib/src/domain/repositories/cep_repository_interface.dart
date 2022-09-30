import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/data/models/cep_model.dart';

abstract class CepRepositoryInterface {
  Future<DataState<CepModel>> getCepFromCode(String code);
}
