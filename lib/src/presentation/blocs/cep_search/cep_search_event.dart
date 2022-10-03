part of 'cep_search_bloc.dart';

@immutable
abstract class CepEvent {
  const CepEvent();
}

class CepSearched extends CepEvent {
  final String code;

  const CepSearched(this.code);
}
