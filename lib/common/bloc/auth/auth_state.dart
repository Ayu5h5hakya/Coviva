import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationUnitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  final String displayName;

  AuthenticationAuthenticated(this.displayName) : super([displayName]);
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}