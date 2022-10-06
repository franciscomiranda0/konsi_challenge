part of 'local_cep_cubit.dart';

@immutable
abstract class LocalCepState {
  const LocalCepState();
}

class LocalCepInitial extends LocalCepState {
  const LocalCepInitial();
}

class AccessInProgress extends LocalCepState {
  const AccessInProgress();
}

class ReadSuccess extends LocalCepState {
  const ReadSuccess();
}

class WriteSuccess extends LocalCepState {
  const WriteSuccess();
}

class EraseSuccess extends LocalCepState {
  const EraseSuccess();
}
