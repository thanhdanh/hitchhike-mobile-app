import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hitchhike/src/blocs/login/bloc.dart';
import 'package:hitchhike/src/constants/colors.dart';
import 'package:hitchhike/src/widgets/line_horizontal_with_text.dart';
import 'package:hitchhike/src/widgets/rounded_button_widget.dart';
import 'package:hitchhike/src/widgets/textfield_widget.dart';

class LogInForm extends StatefulWidget {
  @override
  __LogInFormState createState() => __LogInFormState();
}

class __LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Login Failure'), Icon(Icons.error)],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          }
          if (state.isSubmitting) {
            ScaffoldMessenger.of(context)
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
        },
        child: Container(
          color: AppColors.backgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTopBrand(),
                  SizedBox(height: 24.0),
                  _buildUserIdField(),
                  _buildPasswordField(),
                  SizedBox(height: 24.0),
                  _buildSignInButton(),
                  LineHorizontalWithTextWidget(
                    text: 'Hoặc',
                  ),
                  _GoogleLoginButton(),
                ],
              ),
            ), //
          ),
        ));
  }

  Widget _buildTopBrand() {
    return Container(
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Hitchhike",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                decorationStyle: TextDecorationStyle.wavy,
                color: AppColors.purple[500],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserIdField() {
    return TextFieldWidget(
      icon: Icons.person,
      inputType: TextInputType.emailAddress,
      autoFocus: false,
      inputAction: TextInputAction.next,
    );
  }

  Widget _buildPasswordField() {
    return TextFieldWidget(
      padding: EdgeInsets.only(top: 16.0),
      icon: Icons.lock,
      isObscure: true,
    );
  }

  Widget _buildSignInButton() {
    return RoundedButtonWidget(
      buttonText: "Đăng nhập",
      buttonColor: AppColors.primaryColor,
      textColor: Colors.white,
      onPressed: () async {
        // if (_store.canLogin) {
        //   DeviceUtils.hideKeyboard(context);
        //   _store.login();
        // } else {
        //   _showErrorMessage('Please fill in all fields');
        // }
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);

    return RaisedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'đăng nhập với Gogle',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () => _loginBloc.add(LoginWithGooglePressed()),
      color: Theme.of(context).accentColor,
      shape: StadiumBorder(),
    );
  }
}
