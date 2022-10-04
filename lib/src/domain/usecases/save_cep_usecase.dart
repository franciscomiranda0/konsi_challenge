import 'package:konsi_challenge/src/core/usecases/usecase.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class SaveCepUseCase extends UseCase<void, Cep> {
  CepRepositoryInterface _cepRepository;

  SaveCepUseCase(this._cepRepository);

  @override
  Future<void> call({required Cep params}) {
    return _cepRepository.saveCep(params);
  }
}
