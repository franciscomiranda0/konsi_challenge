import 'package:konsi_challenge/src/core/usecases/usecase.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class GetCepByIdUseCase extends UseCase<Cep?, int> {
  final CepRepositoryInterface _cepRepository;

  GetCepByIdUseCase(this._cepRepository);

  @override
  Future<Cep?> call({required int params}) {
    return _cepRepository.getCepById(params);
  }
}
