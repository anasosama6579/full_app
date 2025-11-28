import 'package:complete_app/core/networking/api_services.dart';
import 'package:complete_app/core/networking/dio_factory.dart';
import 'package:complete_app/features/login/data/repos/login_repo.dart';
import 'package:complete_app/features/login/logic/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getIt  = GetIt.instance;
Future<void> setupGeIt() async {

  // Core Services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Login Feature
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiServices>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}