import 'package:coviva/common/Validator.dart';
import 'package:coviva/common/bloc/login/login_event.dart';
import 'package:coviva/common/bloc/login/login_state.dart';
import 'package:coviva/common/services/userRepository.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
          email: event.email,
          password: event.password
      );
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (value) {
      print(value);
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield currentState.update(
        isEmailValid: Validators.isValidPassword(password)
    );
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield currentState.update(
        isEmailValid: Validators.isValidEmail(email)
    );
  }
}