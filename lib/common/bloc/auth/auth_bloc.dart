import 'package:coviva/common/bloc/auth/auth_event.dart';
import 'package:coviva/common/bloc/auth/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:coviva/common/services/userRepository.dart';
import 'package:flutter/widgets.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => AuthenticationUnitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    // TODO: implement mapEventToState
    if( event is AppStarted){
      yield* _mapAppStartedToState();
    } else if(event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if(event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn) {
        final name = await _userRepository.getUser();
        yield AuthenticationAuthenticated(name);
      }
    }catch(_){
      yield AuthenticationUnauthenticated();
    }
  }

  Stream <AuthenticationState> _mapLoggedInToState() async* {
    yield AuthenticationAuthenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield AuthenticationUnauthenticated();
    _userRepository.signOut();
  }
}
