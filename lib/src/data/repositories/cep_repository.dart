import 'dart:convert' show jsonDecode;

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
  Future<DataState<CepModel>> getCepFromCode(String code) async {
    final baseUrl =
        '${ProductionEnvironment.cepApiHost}${ProductionEnvironment.cepApiPath}';
    final coreResponse = await _remoteDatasource.get('$baseUrl$code.json');

    if (coreResponse.hasError) {
      return const DataFailure<CepModel>(
        errorMessage: Messages.cepRequestFailure,
      );
    } else {
      return DataSuccess<CepModel>(
        data: CepModel.fromMap(
          jsonDecode(coreResponse.data),
        ),
      );
    }
  }
}
