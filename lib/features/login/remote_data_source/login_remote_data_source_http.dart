import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/common/urls.dart';
import 'package:primary_bid/features/login/login_failure.dart';
import 'package:primary_bid/features/login/remote_data_source/login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

  @override
  Future<Either<LoginFailure, String>> login({required String username, required String password}) async {
    try {
      return await _login(username: username, password: password);
    } on SocketException {
      return const Left(LoginFailure.network);
    } on TimeoutException {
      return const Left(LoginFailure.network);
    } catch (e) {
      return const Left(LoginFailure.other);
    }
  }

  Future<Either<LoginFailure, String>> _login({required String username, required String password}) async {
    final response = await _client.post(
      Uri.parse('$baseUrl$loginEndpoint'), // TODO: Unit test this. Rework storing of urls.
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return Right(jsonDecode(response.body)['token']);
    } else if (response.statusCode == 401) {
      return const Left(LoginFailure.auth);
    } else {
      return const Left(LoginFailure.other);
    }
  }
}