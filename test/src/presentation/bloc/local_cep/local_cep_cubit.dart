import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/usecases/erase_cep_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_all_saved_ceps_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_by_id_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/save_cep_usecase.dart';
import 'package:konsi_challenge/src/presentation/blocs/local_cep/local_cep_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late LocalCepCubit _cepLocalCubit;
  late GetAllSavedCepsUseCase _getAllSavedCepsUseCase;
  late GetCepByCodeUseCase _getCepByCodeUseCase;
  late SaveCepUseCase _saveCepUseCase;
  late EraseCepUseCase _eraseCepUseCase;

  setUp(() {
    registerFallbackValue(<Cep>[]);
    registerFallbackValue(null);
    _getAllSavedCepsUseCase = SpyGetAllSavedCepsUseCase();
    _getCepByCodeUseCase = SpyGetCepByCodeUseCase();
    _saveCepUseCase = SpySaveCepUseCase();
    _eraseCepUseCase = SpyEraseCepUseCase();

    _cepLocalCubit = LocalCepCubit(
      getAllSavedCepsUseCase: _getAllSavedCepsUseCase,
      getCepByIdUseCase: _getCepByCodeUseCase,
      saveCepUseCase: _saveCepUseCase,
      eraseCepUseCase: _eraseCepUseCase,
      initialRequest: false,
    );
  });

  blocTest(
    '''
        Should emit [AccessInProgress, ReadSuccess]
        when [getAllSavedCeps] is called.
        ''',
    build: () => _cepLocalCubit,
    setUp: () {
      when(() => _getAllSavedCepsUseCase.call(params: null)).thenAnswer(
        (_) async => <Cep>[Mocks.cep],
      );
    },
    act: (cubit) => cubit.getAllSavedCeps(),
    verify: (_) => [
      isA<AccessInProgress>(),
      isA<ReadSuccess>(),
    ],
  );

  blocTest(
    '''
        Should emit [AccessInProgress, ReadSuccess]
        when [getCepByCode] is called.
        ''',
    build: () => _cepLocalCubit,
    setUp: () {
      when(() => _getCepByCodeUseCase.call(params: Mocks.cepSearch)).thenAnswer(
        (_) async => Mocks.cep,
      );
    },
    act: (cubit) => cubit.getCepByCode(Mocks.cepSearch),
    verify: (_) => [
      isA<AccessInProgress>(),
      isA<ReadSuccess>(),
    ],
  );

  blocTest(
    '''
        Should emit [AccessInProgress, WriteSuccess]
        when [saveCep] is called.
        ''',
    build: () => _cepLocalCubit,
    setUp: () {
      when(() => _saveCepUseCase.call(params: Mocks.cep)).thenAnswer(
        (_) async => <Cep>[Mocks.cep],
      );
    },
    act: (cubit) => cubit.saveCep(Mocks.cep),
    verify: (_) => [
      isA<AccessInProgress>(),
      isA<WriteSuccess>(),
    ],
  );

  blocTest(
    '''
        Should emit [AccessInProgress, EraseSuccess]
        when [eraseCep] event is called.
        ''',
    build: () => _cepLocalCubit,
    setUp: () {
      when(() => _eraseCepUseCase.call(params: Mocks.cep)).thenAnswer(
        (_) async => <Cep>[Mocks.cep],
      );
    },
    act: (cubit) => cubit.eraseCep(Mocks.cep),
    verify: (_) => [
      isA<AccessInProgress>(),
      isA<EraseSuccess>(),
    ],
  );
}
