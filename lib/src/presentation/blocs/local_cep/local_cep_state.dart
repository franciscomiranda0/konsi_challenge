part of 'local_cep_cubit.dart';

@immutable
abstract class LocalCepState {
  final List<Cep>? ceps;

  const LocalCepState(this.ceps);
}

class LocalCepInitial extends LocalCepState {
  const LocalCepInitial() : super(const []);
}

class LocalCepLoadInProgress extends LocalCepState {
  const LocalCepLoadInProgress() : super(const []);
}

class LocalCepLoadSuccess extends LocalCepState {
  const LocalCepLoadSuccess(super.ceps);
}
