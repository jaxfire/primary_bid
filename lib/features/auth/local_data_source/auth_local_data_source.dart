import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:primary_bid/features/common/urls.dart';
import 'package:primary_bid/features/login/login_failure.dart';

abstract class AuthLocalDataSource {
  /// Persists the [authToken] to local storage.
  void setAuthToken({required String authToken});
}
