import 'package:konsi_challenge/src/core/environment/environment.dart';
import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/core/utils/messages.dart';
import 'package:konsi_challenge/src/data/datasources/remote_datasource.dart';
import 'package:konsi_challenge/src/data/models/cep_model.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class CepRepository implements CepRepositoryInterface {
  final RemoteDatasourceInterface _remoteDatasource;

  const CepRepository(RemoteDatasourceInterface remoteDatasource)
      : _remoteDatasource = remoteDatasource;

  @override
  Future<DataState<CepModel>> getCepByCode(String code) async {
    try {
      final coreResponse = await _remoteDatasource.get(
          "${ProductionEnvironment.cepApiScheme}://${ProductionEnvironment.cepApiHost}${ProductionEnvironment.cepApiPathStart}/${code.replaceAll(RegExp(r'[.,]'), '')}${ProductionEnvironment.cepApiPathEnd}");

      if (coreResponse.hasError) {
        return const DataFailure<CepModel>(
          errorMessage: Messages.cepRequestFailure,
        );
      } else {
        return DataSuccess<CepModel>(
          data: CepModel.fromMap(coreResponse.data),
        );
      }
    } catch (_) {
      return const DataFailure<CepModel>(
        errorMessage: Messages.unknownRequestFailure,
      );
    }
  }
}
