part of 'cep_search_bloc.dart';

@immutable
abstract class CepSearchEvent {
  const CepSearchEvent();
}

class CepSearched extends CepSearchEvent {
  final String code;

  const CepSearched(this.code);
}
