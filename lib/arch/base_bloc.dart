import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/remote/error/error_response.dart';
import 'data/remote/error/error_response500.dart';
import 'domain/entities/common/server_error.dart';
import 'domain/entities/failure/api_failure.dart';
import 'domain/entities/failure/failure.dart';
import 'logger.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState) {
    _errorStreamController = StreamController<Failure>();
    _progressStreamController = StreamController<bool>();
  }

  @protected
  late StreamController<Failure> _errorStreamController;

  Stream<Failure> get failureStream => _errorStreamController.stream;

  @protected
  late StreamController<bool> _progressStreamController;

  Stream<bool> get progressStream => _progressStreamController.stream;

  void showProgress() {
    if (!_progressStreamController.isClosed) {
      _progressStreamController.add(true);
    }
  }

  Future<void> hideProgress() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (!_progressStreamController.isClosed) {
      _progressStreamController.add(false);
    }
  }

  void onFailure(Failure failure) {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.add(failure);
    }
  }

  void parseServerFailure(ServerError failure) {
    Logger.log('parseServerFailure: $failure');
    failure.when(
      connection: (connection) {
        onFailure(
          ApiFailure(ServerFailure.connection,
              message: 'Connection error occurred'),
        );
      },
      exception: (exception) {
        onFailure(
          ApiFailure(ServerFailure.exception,
              message: 'Error occurred: ${exception.exception}'),
        );
      },
      common: (common) {
        onFailure(
          ApiFailure(ServerFailure.common, message: 'Common error occurred'),
        );
      },
      unknown: (unknown) {
        onFailure(
          ApiFailure(ServerFailure.unknown, message: 'Error occurred'),
        );
      },
      response: _parseSignUpFailureResponse,
    );
  }

  void _parseSignUpFailureResponse(ResponseFailure response) {
    var errorResponse = response.response;
    if (errorResponse is ErrorResponse) {
      onFailure(
        ApiFailure(
          ServerFailure.response,
          message: errorResponse.message.join('\n'),
        ),
      );
    } else if (errorResponse is ErrorResponse500) {
      onFailure(
        ApiFailure(
          ServerFailure.unauthorized,
          message: errorResponse.message,
        ),
      );
    }
  }

  void dispose() {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.close();
    }
    if (!_progressStreamController.isClosed) {
      _progressStreamController.close();
    }
  }
}
