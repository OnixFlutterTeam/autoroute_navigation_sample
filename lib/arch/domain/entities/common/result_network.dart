import 'package:meta/meta.dart';

import 'server_error.dart';

@sealed
abstract class ResultNetwork<T> {
  R when<R>({
    required R Function(NetworkSuccess<T>) success,
    required R Function(NetworkError) networkError,
    required R Function(NetworkExceptionError) exception,
  }) {
    if (this is NetworkSuccess<T>) {
      return success(this as NetworkSuccess<T>);
    } else if (this is NetworkError) {
      return networkError(this as NetworkError);
    } else if (this is NetworkExceptionError) {
      return exception(this as NetworkExceptionError);
    } else {
      throw Exception('Unhandled part, could be anything');
    }
  }
}

class NetworkSuccess<T> extends ResultNetwork<T> {
  NetworkSuccess(this.data, this.responseCode);

  final T data;
  final int responseCode;
}

class NetworkError<T> extends ResultNetwork<T> {
  NetworkError(this.error);

  final ServerError error;
}

class NetworkExceptionError<T> extends ResultNetwork<T> {
  NetworkExceptionError(this.exception);

  final Exception exception;
}
