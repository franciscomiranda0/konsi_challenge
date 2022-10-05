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
  final GetCepByIdUseCase _getCepByIdUseCase;
  final SaveCepUseCase _saveCepUseCase;
  final EraseCepUseCase _eraseCepUseCase;

  LocalCepCubit({
    required GetAllSavedCepsUseCase getAllSavedCepsUseCase,
    required GetCepByIdUseCase getCepByIdUseCase,
    required SaveCepUseCase saveCepUseCase,
    required EraseCepUseCase eraseCepUseCase,
  })  : _getAllSavedCepsUseCase = getAllSavedCepsUseCase,
        _getCepByIdUseCase = getCepByIdUseCase,
        _saveCepUseCase = saveCepUseCase,
        _eraseCepUseCase = eraseCepUseCase,
        super(const LocalCepInitial());

  Future<void> _getAllSavedCeps() async {
    emit(const LocalCepLoadInProgress());
    final ceps = await _getAllSavedCepsUseCase(params: null);
    emit(LocalCepLoadSuccess(ceps));
  }

  Future<void> _getCepById(int id) async {
    emit(const LocalCepLoadInProgress());
    final ceps = await _getCepByIdUseCase(params: id);
    emit(LocalCepLoadSuccess(ceps != null ? [ceps] : []));
  }

  Future<void> _saveCep(Cep cep) async {
    emit(const LocalCepLoadInProgress());
    await _saveCepUseCase(params: cep);
    emit(const LocalCepLoadSuccess([]));
  }

  Future<void> eraseCep(Cep cep) async {
    emit(const LocalCepLoadInProgress());
    await _eraseCepUseCase(params: cep);
    emit(const LocalCepLoadSuccess([]));
  }
}
