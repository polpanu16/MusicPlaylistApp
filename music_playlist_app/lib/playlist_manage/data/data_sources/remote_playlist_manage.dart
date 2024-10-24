import 'package:dio/dio.dart';
import 'package:music_playlist_app/playlist_manage/data/models/response/get_songs_response_model.dart';

class PlaylistManageService {
  final Dio _dio;
  PlaylistManageService(Dio? dio) : _dio = dio ?? Dio();

  Future<Response<GetSongsResponseModel>> getSongs() async {
    try {
      final response = await _dio.get(
        'uamp/catalog.json',
      );

      final data = GetSongsResponseModel.fromJson(response.data);
      final requestOption = response.requestOptions;

      return Response(
          data: data,
          requestOptions: requestOption,
          statusCode: response.statusCode);
    } on DioException catch (e) {
      throw Exception('Failed to fetch song: ${e.message}');
    }
  }
}
