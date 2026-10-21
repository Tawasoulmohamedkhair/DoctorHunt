import 'dart:async';
import 'dart:io';

import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AppErrorCode {
  network,
  timeout,
  authentication,
  permission,
  validation,
  notFound,
  database,
  unexpected,
}

class AppValidationException implements Exception {
  const AppValidationException();
}

class AppFailure {
  final AppErrorCode code;
  final Object cause;
  final StackTrace stackTrace;

  const AppFailure({
    required this.code,
    required this.cause,
    required this.stackTrace,
  });

  String get userMessage {
    final translations = t;
    return switch (code) {
      AppErrorCode.network => translations.errorNetwork,
      AppErrorCode.timeout => translations.errorTimeout,
      AppErrorCode.authentication => translations.errorAuthentication,
      AppErrorCode.permission => translations.errorPermission,
      AppErrorCode.validation => translations.errorValidation,
      AppErrorCode.notFound => translations.errorNotFound,
      AppErrorCode.database => translations.errorDatabase,
      AppErrorCode.unexpected => translations.errorUnexpected,
    };
  }

  void logDiagnostic(String operation) {
    if (!kDebugMode) return;
    debugPrint('$operation failed: ${code.name} (${cause.runtimeType})');
    debugPrintStack(stackTrace: stackTrace);
  }
}

sealed class AppResult<T> {
  const AppResult();
}

class AppSuccess<T> extends AppResult<T> {
  final T value;

  const AppSuccess(this.value);
}

class AppError<T> extends AppResult<T> {
  final AppFailure failure;

  const AppError(this.failure);
}

AppFailure mapAppFailure(Object error, StackTrace stackTrace) => AppFailure(
  code: _classifyError(error),
  cause: error,
  stackTrace: stackTrace,
);

AppErrorCode _classifyError(Object error) {
  if (error is AppValidationException) return AppErrorCode.validation;
  if (error is TimeoutException) return AppErrorCode.timeout;
  if (error is AuthRetryableFetchException) {
    final status = int.tryParse(error.statusCode ?? '');
    return status != null && status >= 500
        ? AppErrorCode.database
        : AppErrorCode.network;
  }
  if (error is SocketException || error is HttpException) {
    return AppErrorCode.network;
  }
  // The Supabase SDK exposes http.ClientException through its HTTP client,
  // while `http` is only a transitive dependency in this application.
  if (error.runtimeType.toString() == 'ClientException') {
    return AppErrorCode.network;
  }

  if (error is AuthException) {
    final status = int.tryParse(error.statusCode ?? '');
    if (status != null && status >= 500) return AppErrorCode.database;
    if (status == 403) return AppErrorCode.permission;
    return AppErrorCode.authentication;
  }

  if (error is PostgrestException) {
    final code = error.code ?? '';
    if (code == 'PGRST116') return AppErrorCode.notFound;
    if (code == '42501' || code.startsWith('28')) {
      return AppErrorCode.permission;
    }
    if (code.startsWith('22') || code.startsWith('23')) {
      return AppErrorCode.validation;
    }
    if (code.startsWith('08')) return AppErrorCode.network;
    return AppErrorCode.database;
  }

  if (error is StorageException) {
    return _classifyHttpStatus(int.tryParse(error.statusCode ?? ''));
  }

  if (error is FunctionException) {
    if (error is FunctionsFetchException || error.status == 0) {
      return AppErrorCode.network;
    }
    return _classifyHttpStatus(error.status);
  }

  return AppErrorCode.unexpected;
}

AppErrorCode _classifyHttpStatus(int? status) {
  if (status == null) return AppErrorCode.database;
  if (status == 408 || status == 504) return AppErrorCode.timeout;
  if (status == 401) return AppErrorCode.authentication;
  if (status == 403) return AppErrorCode.permission;
  if (status == 404) return AppErrorCode.notFound;
  if (status == 400 || status == 422) return AppErrorCode.validation;
  if (status >= 500) return AppErrorCode.database;
  return AppErrorCode.database;
}
