import 'package:konsi_challenge/src/data/models/cep_model.dart';

abstract class CepRepositoryInterface {
  Future<CepModel> getCepFromCode(String code);
}
