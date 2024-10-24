import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:music_playlist_app/config/dio/dio_config.dart';
import 'package:music_playlist_app/playlist_manage/data/repositories/playlist_manage_repository_impl.dart';
import 'package:music_playlist_app/playlist_manage/domain/repositories/playlist_manage_repository.dart';
import 'package:music_playlist_app/playlist_manage/presentation/bloc/playlist_manage/playlist_manage_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register DioClient as a singleton
  getIt.registerLazySingleton<Dio>(() => DioConfig().dio);

  // Register repositories
  getIt.registerLazySingleton<PlaylistManageRepository>(
      () => PlaylistManageRepositoryImpl(dio: getIt<Dio>()));

  // Register bloc
  getIt.registerCachedFactory(() => PlaylistManageCubit(
      playlistManageRepository: getIt.get<PlaylistManageRepository>()));
}
