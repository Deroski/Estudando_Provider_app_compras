class HttpException implements Exception {
  final String messages;
  final int statusCode;

  HttpException({
    required this.messages,
    required this.statusCode,
  });

  @override
  String toString() {
    return messages;
  }
}
