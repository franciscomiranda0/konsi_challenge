import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsi_challenge/src/core/resources/data_state.dart';
import 'package:konsi_challenge/src/domain/entities/cep.dart';
import 'package:konsi_challenge/src/domain/usecases/get_cep_usecase.dart';

part 'cep_search_event.dart';
part 'cep_search_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final GetCepUseCase _getCepUseCase;

  Cep? _cep;

  CepBloc(this._getCepUseCase) : super(const CepLoadInitial()) {
    on<CepSearched>(_getCepByCode);
  }

  Future<void> _getCepByCode(CepSearched event, Emitter emit) async {
    emit(const CepLoadInProgress());

    _getCepUseCase(params: event.code).then(
      (dataState) {
        if (dataState is DataSuccess) {
          _cep = dataState.data;
          emit(CepLoadSuccess(cep: _cep));
        } else if (dataState is DataFailure) {
          emit(CepLoadError(message: dataState.errorMessage));
        }
      },
    ).whenComplete(() => const CepLoadProgressEnd());
  }

  Cep? get lastSearchedCep => _cep;
}
