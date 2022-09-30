part of 'cep_bloc.dart';

@immutable
abstract class CepState {
  final Cep? cep;
  final String? message;

  const CepState({
    this.cep,
    this.message,
  });
}

class CepLoadInitial extends CepState {
  const CepLoadInitial();
}

class CepLoadInProgress extends CepState {
  const CepLoadInProgress();
}

class CepLoadSuccess extends CepState {
  const CepLoadSuccess({required super.cep});
}

class CepLoadError extends CepState {
  const CepLoadError({required super.message});
}
