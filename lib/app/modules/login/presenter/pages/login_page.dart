import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reqresapp/app/modules/login/presenter/stores/login_store.dart';
import 'package:reqresapp/app/modules/login/presenter/widgets/background.widget.dart';
import 'package:reqresapp/app/modules/login/presenter/widgets/roundedInput.widget.dart';
import 'package:reqresapp/app/modules/login/presenter/widgets/roundedbutton.widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: size.height * 0.06),
              _observerField(
                hintText: "Email",
                onChanged: controller.changeEmail,
                errorText: controller.validateEmail,
              ),
              _observerField(
                hintText: "Senha",
                onChanged: controller.changePassword,
                errorText: controller.validatePassword,
              ),
              _observerButton(),
              _observerErrorText(),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  _observerField({String hintText, onChanged, errorText}) {
    return Observer(builder: (_) {
      return RoundedInputField(
        hintText: hintText,
        onChanged: onChanged,
        errorText: errorText,
      );
    });
  }

  _observerErrorText() {
    return Observer(builder: (_) {
      return controller.haveError
          ? Text(
              controller.messageError,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.red,
              ),
            )
          : Container();
    });
  }

  _observerButton() {
    return Observer(builder: (_) {
      return RoundedButton(
        text: "LOGIN",
        press: () {
          bool keyboardIsOpen = FocusScope.of(context).hasFocus;
          if (keyboardIsOpen) FocusScope.of(context).unfocus();
          controller.isValid ? controller.login() : null;
        },
      );
    });
  }
}
