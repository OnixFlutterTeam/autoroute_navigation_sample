import 'failure.dart';

class ApiFailure implements Failure {
  ApiFailure(this.failure, {this.message = ''});

  final ServerFailure failure;
  final String message;

  @override
  String toString() {
    return 'ApiFailure{$failure, message: $message}';
  }
}

enum ServerFailure {
  connection,
  exception,
  response,
  common,
  unknown,
  unauthorized
}
