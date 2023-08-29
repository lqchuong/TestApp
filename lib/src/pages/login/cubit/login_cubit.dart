import 'dart:developer';
import 'dart:io';

import 'package:acecook/src/model/credential_model.dart';
import 'package:acecook/src/network/auth_service.dart';
import 'package:acecook/src/network/network_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:platform_device_id/platform_device_id.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  late SharedPreferences prefs;

  Future<void> initLogin() async {
    prefs = await SharedPreferences.getInstance();

    emit(LoginInitialSucess());
  }

  Future<void> tapSaveInfoLogin(bool isSaveInfoLogin) async {
    print('tap');

    emit(SaveInfoLoginSuccess(isSaveInfoLogin));
  }

  void tapObscure(bool isTapObscure) {
    print('tap');

    emit(TapObscureSuccess(isTapObscure));
  }

  Future<void> submitEvent(String username, String password) async {
    // Uri url = Uri.parse(
    //     'http://training.acecookshop.acecookvietnam.vn:2022/gt_back_end/oauth/token?grant_type=password&username=0932789016&password=919164');
    // Map<String, String> header = <String, String>{
    //   'Authorization': 'Basic Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=',
    // };
    // http
    //     .post(
    //   url,
    //   headers: header,
    // )
    //     .then((response) {
    //   print(response.statusCode);
    //   if (response.statusCode == 200) {
    //     emit(LoginSuccess());
    //   } else {
    //     emit(LoginFailed());
    //   }
    // });

    final authService = NetworkService.client.getService<AuthService>();
    // prefs = await SharedPreferences.getInstance();
    emit(LoginSuccess());
    // try {
    //   NetworkService.addAuthorizationHeader(
    //       'Basic Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=');
    //   final response = await authService.login(username, password);

    //   if (response.isSuccessful) {
    //     final CredentialModel credential =
    //         CredentialModel.fromJson(response.body);
    //     AuthenResponseModel.clientInfo = credential.authenResponse;

    //     NetworkService.addAuthorizationHeader(
    //         'Bearer ${credential.accessToken}');
    //     print(AuthenResponseModel.clientInfo.clientId);
    //     emit(LoginSuccess());
    //   } else {
    //     emit(LoginFailed(error: response.error.toString()));
    //   }
    // } catch (e, trace) {
    //   print('ERROR : ${e.toString()}');
    //   print('TRACE : ${trace.toString()}');
    //   emit(LoginFailed());
    // }
  }
}
