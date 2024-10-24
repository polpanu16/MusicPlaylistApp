import 'dart:io' show HttpStatus;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:music_playlist_app/core/resources/data_state.dart';

abstract class BaseApiRepository {
  final Dio dio;
  BaseApiRepository({required this.dio});

  /// This method handles the given `request`, returning a `DataState<T>`.
  ///
  /// If the response is successful (status code 200), it returns a `DataSuccess`
  /// containing the data.
  ///
  /// If there's an error during the request, it returns a `DataFailed`
  /// containing the `DioError`.
  @protected
  Future<DataState<T>> getStateOf<T>(
      Future<Response<T>> Function() request) async {
    try {
      final response = await request();

      if (response.statusCode == HttpStatus.ok && response.data != null) {
        return DataSuccess(response.data as T);
      } else {
        throw DioException(
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        return const DataNotFound();
      }
      return DataError(e);
    } catch (e) {
      print(e);
      return DataError(
        DioException(
          error: 'Unknown error',
          requestOptions: RequestOptions(),
        ),
      );
    }
  }
}
