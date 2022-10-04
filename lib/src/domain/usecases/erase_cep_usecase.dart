import 'package:konsi_challenge/src/core/usecases/usecase.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class EraseCepUseCase extends UseCase<void, Cep> {
  final CepRepositoryInterface _cepRepository;

  EraseCepUseCase(this._cepRepository);

  @override
  Future<void> call({required Cep params}) {
    return _cepRepository.eraseCep(params);
  }
}
