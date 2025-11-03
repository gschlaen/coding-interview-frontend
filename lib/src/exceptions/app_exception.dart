sealed class AppException implements Exception {
  AppException(this.message, [this.statusCode]);
  final String message;
  int? statusCode;

  @override
  String toString() => message;
}

class NoDataException extends AppException {
  NoDataException() : super('No recommendation data found');
}
