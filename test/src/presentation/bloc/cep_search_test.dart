import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/core/utils/messages.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_usecase.dart';
import 'package:konsi_challenge/src/presentation/blocs/cep_search/cep_search_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

class SpyGetCepUseCase extends Mock implements GetCepUseCase {}

void main() {
  late CepSearchBloc _cepSearchBloc;
  late GetCepUseCase _getCepUseCase;

  setUp(() {
    _getCepUseCase = SpyGetCepUseCase();
    _cepSearchBloc = CepSearchBloc(_getCepUseCase);
  });

  group(
    '[_getCepByCode] tests:',
    () {
      blocTest(
        '''
        Should emit [CepLoadInProgress, CepLoadSuccess]
        when [CepSearched] event is added.
        ''',
        build: () => _cepSearchBloc,
        setUp: () {
          when<Future<DataState<Cep>>>(
              () => _getCepUseCase.call(params: Mocks.cepSearch)).thenAnswer(
            (_) async => const DataSuccess<Cep>(data: Mocks.cep),
          );
        },
        act: (bloc) => bloc.add(const CepSearched(Mocks.cepSearch)),
        verify: (_) => [
          isA<CepLoadInProgress>(),
          isA<CepLoadSuccess>(),
        ],
      );

      blocTest(
        '''
        Should emit [CepLoadInProgress, CepLoadError]
        when [CepSearched] event is added.
        ''',
        build: () => _cepSearchBloc,
        setUp: () {
          when<Future<DataState<Cep>>>(
              () => _getCepUseCase.call(params: Mocks.cepSearch)).thenAnswer(
            (_) async => const DataFailure<Cep>(
                errorMessage: Messages.cepRequestFailure),
          );
        },
        act: (bloc) => bloc.add(const CepSearched(Mocks.cepSearch)),
        verify: (_) => [
          isA<CepLoadInProgress>(),
          isA<CepLoadError>().having(
            (state) => state.message,
            'message',
            Messages.cepRequestFailure,
          ),
        ],
      );
    },
  );
}
