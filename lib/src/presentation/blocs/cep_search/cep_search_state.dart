part of 'cep_search_bloc.dart';

@immutable
abstract class CepSearchState {
  final Cep? cep;
  final String? message;

  const CepSearchState({
    this.cep,
    this.message,
  });
}

class CepInitial extends CepSearchState {
  const CepInitial();
}

class CepLoadInProgress extends CepSearchState {
  const CepLoadInProgress();
}

class CepLoadSuccess extends CepSearchState {
  const CepLoadSuccess({required super.cep});

  @override
  Cep get cep => super.cep!;
}

class CepLoadError extends CepSearchState {
  const CepLoadError({required super.message});

  @override
  String get message => super.message!;
}

class CepLoadProgressEnd extends CepSearchState {
  const CepLoadProgressEnd();
}
