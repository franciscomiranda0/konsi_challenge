import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/usecases/erase_cep_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_all_saved_ceps_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_by_id_usecase.dart';
import 'package:konsi_challenge/src/domain/usecases/save_cep_usecase.dart';

part 'local_cep_state.dart';

class LocalCepCubit extends Cubit<LocalCepState> {
  final GetAllSavedCepsUseCase _getAllSavedCepsUseCase;
  final GetCepByCodeUseCase _getCepByCodeUseCase;
  final SaveCepUseCase _saveCepUseCase;
  final EraseCepUseCase _eraseCepUseCase;

  final _ceps = <Cep>[];

  LocalCepCubit({
    required GetAllSavedCepsUseCase getAllSavedCepsUseCase,
    required GetCepByCodeUseCase getCepByIdUseCase,
    required SaveCepUseCase saveCepUseCase,
    required EraseCepUseCase eraseCepUseCase,
    bool initialRequest = true,
  })  : _getAllSavedCepsUseCase = getAllSavedCepsUseCase,
        _getCepByCodeUseCase = getCepByIdUseCase,
        _saveCepUseCase = saveCepUseCase,
        _eraseCepUseCase = eraseCepUseCase,
        super(const LocalCepInitial()) {
    if (initialRequest) getAllSavedCeps();
  }

  Future<void> getAllSavedCeps() async {
    emit(const AccessInProgress());
    _wipeData();
    _ceps.addAll(await _getAllSavedCepsUseCase(params: null));

    emit(const ReadSuccess());
  }

  Future<void> getCepByCode(String code) async {
    emit(const AccessInProgress());
    _wipeData();
    final cep = await _getCepByCodeUseCase(
      params: code.replaceAll(RegExp(r'[.,]'), ''),
    );
    if (cep != null) {
      _ceps.add(cep);
      emit(const ReadSuccess());
    }
  }

  Future<void> saveCep(Cep cep) async {
    emit(const AccessInProgress());
    await _saveCepUseCase(params: cep);
    emit(const WriteSuccess());
  }

  Future<void> eraseCep(Cep cep) async {
    emit(const AccessInProgress());
    await _eraseCepUseCase(params: cep);
    emit(const EraseSuccess());
  }

  void _wipeData() => _ceps.removeRange(0, _ceps.length);

  List<Cep> get ceps => List.of(_ceps);
}
