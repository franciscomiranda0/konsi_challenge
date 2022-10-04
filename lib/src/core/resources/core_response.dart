class CoreResponse {
  final bool hasError;
  final Map<String, dynamic> data;

  const CoreResponse({
    required this.hasError,
    required this.data,
  });
}
