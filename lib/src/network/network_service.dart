import 'dart:async';
import 'dart:io';

import 'package:acecook/src/network/auth_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:acecook/src/model/credential_model.dart';

class NetworkService {
  static late final ChopperClient _chopper;
  static late ValueNotifier<String?> _token;

  static ChopperClient get client => _chopper;

  static T getService<T extends ChopperService>() => _chopper.getService<T>();

  static void initialize() {
    _token = ValueNotifier(null);
    _chopper = ChopperClient(
      baseUrl: Uri.parse('http://192.168.20.27:8081/solution-base-web/'),
      converter: JsonConverter(),
      interceptors: [
        if (kDebugMode) ...[HttpLoggingInterceptor()],
        AuthenticationInterceptor(_token),
      ],
      services: [AuthService.create()],
    );
  }

  static void addAuthorizationHeader(String token) => _token.value = token;
  static void removeAuthorizationHeader() => _token.value = null;
}

// class RoutineConverter implements Converter {
//
// }

/// Use this for refresh token and retry when request was unauthorized
class RefreshAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) {
    throw UnimplementedError();
  }
}

class AuthenticationInterceptor implements RequestInterceptor {
  final ValueNotifier<String?> token;

  const AuthenticationInterceptor(this.token);

  @override
  FutureOr<Request> onRequest(Request request) async {
    if (token.value != null) {
      return request.copyWith(headers: {
        ...request.headers,
        HttpHeaders.authorizationHeader: '${token.value}'
      });
    }
    return request;
  }
}
