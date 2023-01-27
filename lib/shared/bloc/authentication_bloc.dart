import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../shared.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AppStarted>(
      (event, emit) async {
        // String sessionId = await storage.getString(
        //     boxName: describeEnum(StorageConstants.user), key: 'sessionId');
        // if (sessionId == '') {
        //   emit(const AuthenticationUnauthenticated());
        // } else {
          emit(const AuthenticationAuthenticated());
        // }
      },
    );
    on<LoggedIn>((event, emit) async {
      emit(const AuthenticationAuthenticated());
    });
    on<LoggedOut>((event, emit) async {
      emit(const AuthenticationAuthenticated());
    });
  }
}
