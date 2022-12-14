import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:konsi_challenge/src/core/utils/constants.dart';
import 'package:konsi_challenge/src/data/datasources/local_datasource/database/app_database.dart';
import 'package:konsi_challenge/src/data/datasources/remote_datasource.dart';
import 'package:konsi_challenge/src/data/repositories/cep_repository.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';
import 'package:konsi_challenge/src/domain/usecases/erase_cep_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_all_saved_ceps_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_by_id_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/save_cep_usecase.dart';
import 'package:konsi_challenge/src/presentation/blocs/cep_search/cep_search_bloc.dart';
import 'package:konsi_challenge/src/presentation/blocs/local_cep/local_cep_cubit.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder(Constants.cepTableName).build();
  injector.registerSingleton<AppDatabase>(database);
  injector.registerSingleton<Dio>(Dio());
  injector.registerSingleton<RemoteDatasourceInterface>(
    RemoteDatasource(injector()),
  );
  injector.registerSingleton<CepRepositoryInterface>(CepRepository(
    database: injector(),
    remoteDatasource: injector(),
  ));
  injector.registerSingleton<GetCepUseCase>(GetCepUseCase(injector()));
  injector.registerSingleton<GetAllSavedCepsUseCase>(
    GetAllSavedCepsUseCase(injector()),
  );
  injector
      .registerSingleton<GetCepByCodeUseCase>(GetCepByCodeUseCase(injector()));
  injector.registerSingleton<SaveCepUseCase>(SaveCepUseCase(injector()));
  injector.registerSingleton<EraseCepUseCase>(EraseCepUseCase(injector()));
  injector.registerSingleton<CepSearchBloc Function(BuildContext)>(
      (_) => CepSearchBloc(injector()));
  injector.registerSingleton<LocalCepCubit Function(BuildContext)>(
    (_) => LocalCepCubit(
      eraseCepUseCase: injector(),
      getAllSavedCepsUseCase: injector(),
      getCepByIdUseCase: injector(),
      saveCepUseCase: injector(),
    )..getAllSavedCeps(),
  );
}
