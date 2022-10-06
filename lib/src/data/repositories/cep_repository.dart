import 'package:konsi_challenge/src/core/environment/environment.dart';
import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/core/utils/messages.dart';
import 'package:konsi_challenge/src/data/datasources/local_datasource/database/app_database.dart';
import 'package:konsi_challenge/src/data/datasources/remote_datasource.dart';
import 'package:konsi_challenge/src/data/models/cep_model.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';

class CepRepository implements CepRepositoryInterface {
  final AppDatabase _appDatabase;
  final RemoteDatasourceInterface _remoteDatasource;

  const CepRepository({
    required AppDatabase database,
    required RemoteDatasourceInterface remoteDatasource,
  })  : _appDatabase = database,
        _remoteDatasource = remoteDatasource;

  @override
  Future<DataState<CepModel>> getCepData(String code) async {
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

  @override
  Future<void> eraseCep(Cep cep) async {
    return _appDatabase.cepDao.deleteCep(cep);
  }

  @override
  Future<List<Cep>> getAllCeps() async {
    return _appDatabase.cepDao.getAllCeps();
  }

  @override
  Future<Cep?> getCepByCode(String code) async {
    return _appDatabase.cepDao.getCepByCode(code);
  }

  @override
  Future<void> saveCep(Cep cep) async {
    return _appDatabase.cepDao.insertCep(cep);
  }
}
