import 'package:meta/meta.dart';

@sealed
abstract class ServerError<T> {
  R when<R>({
    required R Function(ConnectionFailure) connection,
    required R Function(ExceptionFailure) exception,
    required R Function(CommonFailure) common,
    required R Function(UnknownFailure) unknown,
    required R Function(ResponseFailure<T>) response,
  }) {
    if (this is ConnectionFailure) {
      return connection(this as ConnectionFailure);
    } else if (this is ExceptionFailure) {
      return exception(this as ExceptionFailure);
    } else if (this is CommonFailure) {
      return common(this as CommonFailure);
    } else if (this is UnknownFailure) {
      return unknown(this as UnknownFailure);
    } else if (this is ResponseFailure<T>) {
      return response(this as ResponseFailure<T>);
    } else {
      throw Exception('Unhandled part, could be anything');
    }
  }
}

class ConnectionFailure extends ServerError {}

class ExceptionFailure extends ServerError {
  ExceptionFailure(this.exception);

  final Exception exception;
}

class ResponseFailure<T> extends ServerError<T> {
  ResponseFailure(this.response);

  final T response;
}

class CommonFailure extends ServerError {}

class UnknownFailure extends ServerError {}
