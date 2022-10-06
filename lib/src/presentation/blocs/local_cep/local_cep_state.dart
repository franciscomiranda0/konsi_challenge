part of 'local_cep_cubit.dart';

@immutable
abstract class LocalCepState {
  const LocalCepState();
}

abstract class WithData extends LocalCepState {
  final List<Cep> ceps;

  const WithData(this.ceps);
}

class LocalCepInitial extends LocalCepState {
  const LocalCepInitial();
}

class AccessInProgress extends LocalCepState {
  const AccessInProgress();
}

class ReadSuccess extends WithData {
  const ReadSuccess(super.ceps);
}

class WriteSuccess extends LocalCepState {
  const WriteSuccess();
}

class EraseSuccess extends LocalCepState {
  const EraseSuccess();
}
