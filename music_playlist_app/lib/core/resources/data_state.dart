import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataNotFound<T> extends DataState<T> {
  const DataNotFound() : super(data: null);
}

class DataError<T> extends DataState<T> {
  const DataError(DioException error) : super(error: error);
}
