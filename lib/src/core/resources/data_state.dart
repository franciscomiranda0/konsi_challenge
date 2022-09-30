abstract class DataState<T> {
  final T? data;
  final String? errorMessage;

  const DataState({
    this.data,
    this.errorMessage,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({
    required super.data,
  }) : assert(data != null);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure({
    required super.errorMessage,
  }) : assert(errorMessage != null);
}
