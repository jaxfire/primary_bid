import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:primary_bid/features/common/data/exceptions.dart';
import 'package:primary_bid/features/common/data/urls.dart';
import 'package:primary_bid/features/login/data/failures/login_failure.dart';
import 'package:primary_bid/features/login/domain/values/value_objects.dart';

abstract class LoginRemoteDataSource {
  /// Calls the https://fakestoreapi.com/auth/login endpoint.
  ///
  /// Throws a [AuthException] for 401 Unauthorized responses.
  /// Throws a [ServerException] for all other error codes and exceptions
  Future<Either<LoginFailure, String>> login({required Username username, required Password password});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({required http.Client client}) : _client = client;

  final http.Client _client;

  // TODO: Change. Don't use a Failure here? Throw all exceptions and have the repository map them to failures?
  @override
  Future<Either<LoginFailure, String>> login({required Username username, required Password password}) async {

    // TODO:
    String new_username = username.value.right;
    String new_password = password.value.right;

    final response = await _client.post(
      Uri.parse('$baseUrl$loginEndpoint'), // TODO: Unit test this
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      // body: jsonEncode({'username': username.value.right, 'password': password.value.right}),
      body: jsonEncode({'username': new_username, 'password': new_password}),
    );

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return Right(jsonDecode(response.body)['token']);
    } else if (response.statusCode == 401) {
      throw AuthException();
    } else {
      throw ServerException();
    }
  }
}
