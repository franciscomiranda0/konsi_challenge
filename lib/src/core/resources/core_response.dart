class CoreResponse<T> {
  final int statusCode;
  final String data;

  const CoreResponse({
    required this.statusCode,
    required this.data,
  });
}
