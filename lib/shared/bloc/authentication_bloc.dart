import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tmdb/models/models.dart';
import 'package:flutter_tmdb/repository/user_repo.dart';

import '../shared.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    UserRepo userRepo = UserRepo();
    on<AuthenticationEvent>((event, emit) {});
    on<AppStarted>(
      (event, emit) async {
        // try {
        //   await userRepo.getSession();
        // } on DioError catch (e) {
        //   // ignore: use_rethrow_when_possible
        //   throw e;
        // }
      },
    );
    on<GetTokenEvent>((event, emit) async {
      try {
        RequestTokenResponseModel response = await userRepo.getToken();
        emit(GetTokenSuccessState(response));
      } catch (e) {
        // ignore: use_rethrow_when_possible
        throw e;
      }
    });
    on<ValidateTokenEvent>((event, emit) async {
      try {
        await userRepo.validateToken();
        emit(const ValidateTokenSuccessState());
      } catch (e) {
        // ignore: use_rethrow_when_possible
        throw e;
      }
    });
    on<GetSessionEvent>((event, emit) async {
      try {
        String token = await storage.getString(
            boxName: describeEnum(StorageConstants.user), key: 'token');
        ValidateTokenResponseModel response = await userRepo.getSession(token);
        emit(GetSessionSuccessState(response));
      } on DioError catch (e) {
        // ignore: use_rethrow_when_possible
        throw e;
      }
    });
    on<LoggedIn>((event, emit) async {
      emit(const AuthenticationAuthenticated());
    });
    on<LoggedOut>((event, emit) async {
      emit(const AuthenticationAuthenticated());
    });
  }
}
