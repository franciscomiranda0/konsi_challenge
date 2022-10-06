import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/usecases/erase_cep_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_all_saved_ceps_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_by_id_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/save_cep_usecase.dart';
import 'package:mocktail/mocktail.dart';

class SpyGetCepUseCase extends Mock implements GetCepUseCase {}

class SpyGetAllSavedCepsUseCase extends Mock implements GetAllSavedCepsUseCase {
}

class SpyGetCepByCodeUseCase extends Mock implements GetCepByCodeUseCase {}

class SpySaveCepUseCase extends Mock implements SaveCepUseCase {}

class SpyEraseCepUseCase extends Mock implements EraseCepUseCase {}

class Mocks {
  const Mocks._();

  static const cep = Cep(
    code: 'code',
    state: 'state',
    city: 'city',
    neighborhood: 'neighborhood',
    street: 'street',
  );
  static const cepSearch = '12345678';
}
