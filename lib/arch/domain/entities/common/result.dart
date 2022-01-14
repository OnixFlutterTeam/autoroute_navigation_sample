import 'package:meta/meta.dart';

@sealed
abstract class Result<T, K> {
  R when<R>({
    required R Function(Success<T, K>) success,
    required R Function(Fail<T, K>) failure,
  }) {
    if (this is Success<T, K>) {
      return success(this as Success<T, K>);
    } else if (this is Fail<T, K>) {
      return failure(this as Fail<T, K>);
    } else {
      throw Exception('Unhendled part, could be anything');
    }
  }
}

class Success<T, K> extends Result<T, K> {
  Success(this.data);

  final T data;
}

class Fail<T, K> extends Result<T, K> {
  Fail(this.failure);

  final K failure;
}
