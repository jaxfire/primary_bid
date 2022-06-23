import 'package:get_it/get_it.dart';
import 'package:primary_bid/features/auth/auth_repository.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source.dart';
import 'package:primary_bid/features/auth/local_data_source/auth_local_data_source_hive.dart';
import 'package:primary_bid/features/cart/cart_repository.dart';
import 'package:primary_bid/features/cart/local_data_source/cart_local_data_source.dart';
import 'package:primary_bid/features/cart/local_data_source/cart_local_data_source_hive.dart';
import 'package:primary_bid/features/categories/category_repository.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source.dart';
import 'package:primary_bid/features/categories/remote_data_source/category_remote_data_source_http.dart';
import 'package:primary_bid/features/login/login_repository.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source_http.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/product/product_repository.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source.dart';
import 'package:primary_bid/features/product/remote_data_source/product_remote_data_source_http.dart';
import 'package:primary_bid/presentation/categories_screen/cubit/categories_cubit.dart';
import 'package:primary_bid/presentation/common/input_validators/password_validator.dart';
import 'package:primary_bid/presentation/common/input_validators/username_validator.dart';
import 'package:primary_bid/presentation/common/widgets/cart_icon/cubit/cart_icon_cubit.dart';
import 'package:primary_bid/presentation/login_screen/cubit/login_cubit.dart';
import 'package:primary_bid/presentation/product_list_screen/cubit/product_list_cubit.dart';
import 'package:primary_bid/presentation/product_list_screen/widgets/product_list_button/product_list_button_cubit/product_list_button_cubit.dart';


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


  // ProductList
  getIt.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceHttp(client: getIt()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(productRemoteDataSource: getIt()));
  getIt.registerFactory<ProductListCubit>(() => ProductListCubit(productRepository: getIt()));


  // CartIcon
  getIt.registerLazySingleton<CartLocalDataSource>(() => CartLocalDataSourceHive());
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(cartLocalDataSource: getIt()));
  getIt.registerLazySingleton<CartIconCubit>(() => CartIconCubit(cartRepository: getIt()));


  // ProductListButton
  getIt.registerLazySingleton<ProductListButtonCubit>(() => ProductListButtonCubit(cartRepository: getIt()));


  // 3rd party
  getIt.registerLazySingleton<http.Client>(() => http.Client());
}