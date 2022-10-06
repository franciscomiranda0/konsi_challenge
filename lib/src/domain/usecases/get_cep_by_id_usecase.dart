import 'package:konsi_challenge/src/core/usecases/usecase.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class GetCepByCodeUseCase extends UseCase<Cep?, String> {
  final CepRepositoryInterface _cepRepository;

  GetCepByCodeUseCase(this._cepRepository);

  @override
  Future<Cep?> call({required String params}) {
    return _cepRepository.getCepByCode(params);
  }
}
