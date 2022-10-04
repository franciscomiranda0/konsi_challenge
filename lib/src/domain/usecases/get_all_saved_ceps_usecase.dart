import 'package:konsi_challenge/src/core/usecases/usecase.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class GetAllSavedCepsUseCase extends UseCase<List<Cep>, void> {
  final CepRepositoryInterface _cepRepository;

   GetAllSavedCepsUseCase(this._cepRepository);

  @override
  Future<List<Cep>> call({required params}) {
    return _cepRepository.getAllCeps();
  }
}