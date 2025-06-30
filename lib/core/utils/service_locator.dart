import 'package:bibliogo/core/utils/api_service.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
