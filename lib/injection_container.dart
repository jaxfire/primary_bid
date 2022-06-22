import 'package:get_it/get_it.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source_hive.dart';
import 'package:primary_bid/features/common/presentation/input_validators/password_validator.dart';
import 'package:primary_bid/features/common/presentation/input_validators/username_validator.dart';
import 'package:primary_bid/features/login/login_repository.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source_http.dart';
import 'package:primary_bid/presentation/login/cubit/login_cubit.dart';
import 'package:http/http.dart' as http;


final getIt = GetIt.instance;

initDependencies() async {

  getIt.registerFactory<UsernameValidator>(() => UsernameValidator());
  getIt.registerFactory<PasswordValidator>(() => PasswordValidator());

  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceHttp(client: getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginRemoteDataSource: getIt()));

  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceHive());

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt(), getIt(), getIt()));
}