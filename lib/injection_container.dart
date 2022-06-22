import 'package:get_it/get_it.dart';
import 'package:primary_bid/features/auth/auth_repository.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source_hive.dart';
import 'package:primary_bid/features/categories/category_repository.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source_http.dart';
import 'package:primary_bid/features/common/presentation/input_validators/password_validator.dart';
import 'package:primary_bid/features/common/presentation/input_validators/username_validator.dart';
import 'package:primary_bid/features/login/login_repository.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source_http.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/presentation/categories_screen/cubit/categories_cubit.dart';
import 'package:primary_bid/presentation/login_screen/cubit/login_cubit.dart';


final getIt = GetIt.instance;

initDependencies() async {

  // Login
  getIt.registerFactory<UsernameValidator>(() => UsernameValidator());
  getIt.registerFactory<PasswordValidator>(() => PasswordValidator());

  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceHttp(client: getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginRemoteDataSource: getIt()));

  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceHive());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authLocalDataSource: getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt(), getIt(), getIt()));


  // Categories
  getIt.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceHttp(client: getIt()));
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(categoryRemoteDataSource: getIt()));

  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(categoryRepository: getIt()));

  // 3rd party
  getIt.registerLazySingleton<http.Client>(() => http.Client());
}