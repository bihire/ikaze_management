// import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoadLogin>(
      (event, emit) async {
        emit(LoginLoading());
        try {
          final response = await const WebClient().authpost('/auth/login', {
            'phone': event.phone,
            'password': event.password,
          });

          await putString('token', response['data']['token']);

          Navigator.pushNamed(event.context, '/myshops');
          // Navigator.pushNamedAndRemoveUntil(
          //     event.context, '/myshops', ModalRoute.withName('/onboarding'));
          // flushErrorMsg('your alarms are all set everyday at ', event.context);
          emit(LoginLoaded());
        } catch (error) {
          emit(LoginError(error.toString()));
        }
      },
    );
  }
}
