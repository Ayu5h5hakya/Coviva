import 'package:coviva/common/bloc/auth/auth_bloc.dart';
import 'package:coviva/common/bloc/auth/auth_event.dart';
import 'package:coviva/common/bloc/login/login_bloc.dart';
import 'package:coviva/common/bloc/login/login_event.dart';
import 'package:coviva/common/bloc/login/login_state.dart';
import 'package:coviva/common/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc loginBloc;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool get isPopulated =>
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState loginState) {
    return loginState.isFormValid && isPopulated && !loginState.isSubmitting;
  }

  @override
  void initState() {
    // TODO: implement initStateq
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Login Failure'), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ));
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Success'),
              ),
            );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return _setupLoginBody(state);
      }),
    );
  }

  Widget _setupLoginBody(LoginState state) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/images/minimalism.png', height: 20),
            ),
            TextFormField(
              controller: emailController,
              decoration:
                  InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
              autovalidate: true,
              autocorrect: true,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: 'Password'),
              obscureText: true,
              autocorrect: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LoginButton(
                    onPressed: () {
                      isLoginButtonEnabled(state) ? _onFormSubmitted() : null;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onEmailChanged() {
    loginBloc.dispatch(
      EmailChanged(email: emailController.text),
    );
  }

  void _onPasswordChanged() {
    loginBloc.dispatch(
      PasswordChanged(password: passwordController.text),
    );
  }

  void _onFormSubmitted() {
    loginBloc.dispatch(
      LoginWithCredentialsPressed(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
