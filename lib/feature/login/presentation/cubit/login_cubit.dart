import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_applicarion/core/cache/app_shared_pref.dart';
import '../../../../core/constant/constant.dart';
import '../../domain/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _repo;
  LoginCubit(this._repo) : super(LoginInitial());

  final formkey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formkey.currentState!.validate()) {
      emit(LoginLoadingState());
      final result = await _repo.login(
        username: "saheralaa555@gmail.com",
        password: "1111111Sa",
        grantType: "password",
        scope: "offline_access",
      );
      result.fold((l) => emit(LoginFailureState(l.message)), (r) async {
        await SharedPref().set(tokenValue, r.accessToken!);

        emit(LoginSuccessState());
      });
    }
  }
}
