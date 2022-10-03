import 'package:get_it/get_it.dart';
import 'package:konsi_challenge/src/data/datasources/remote_datasource.dart';
import 'package:konsi_challenge/src/data/repositories/cep_repository.dart';
import 'package:konsi_challenge/src/domain/repositories/cep_repository_interface.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_usecase.dart';
import 'package:konsi_challenge/src/presentation/blocs/cep_search/cep_search_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<RemoteDatasourceInterface>(RemoteDatasource());
  injector.registerSingleton<CepRepositoryInterface>(CepRepository(injector()));
  injector.registerSingleton<GetCepUseCase>(GetCepUseCase(injector()));
  injector.registerFactory<CepSearchBloc>(() => CepSearchBloc(injector()));
}
