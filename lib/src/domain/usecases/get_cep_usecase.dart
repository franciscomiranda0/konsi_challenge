import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/core/usecases/usecase.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class GetCepUseCase implements UseCase<DataState<Cep>, String> {
  final CepRepositoryInterface _cepRepository;

  const GetCepUseCase(CepRepositoryInterface cepRepository)
      : _cepRepository = cepRepository;

  @override
  Future<DataState<Cep>> call({required String params}) {
    return _cepRepository.getCepFromCode(params);
  }
}
