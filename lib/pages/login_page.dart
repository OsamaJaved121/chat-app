// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field

//Packages
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

//Provideers
import '../providers/authentication_provider.dart';

//Services
import '../services/navigation_service.dart';

//Widgets
import '../widgets/custom_input_field.dart';
import '../widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  late double _deviceHeight;
  late double _deviceWidth;

  late AuthenticationProvider _auth;
  late NavigationService _navigation;

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationService>();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: _deviceWidth * 0.03,
          //     vertical: _deviceHeight * 0.02,
          //   ),
          //   height: _deviceHeight * 0.98,
          //   width: _deviceWidth * 0.97,
          //   child:
          ListView(
        children: [
          SizedBox(
            height: _deviceWidth > 500 ? _deviceWidth*0.1 : _deviceWidth*0.2,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _pageTitle(),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              _deviceWidth > 500 ? const SizedBox(height: 20,) : const SizedBox(),
              _loginForm(),
              SizedBox(
                height: _deviceHeight * 0.05,
              ),
              _loginButton(),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
              _registerAccountLink(),
            ],
            //),
          ),
        ],
      ),
    );
  }

  Widget _pageTitle() {
    return SizedBox(
      height: _deviceWidth > 500 ? _deviceHeight * 0.20 : _deviceHeight * 0.10,
      child: const Text(
        'ChApp',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      height: _deviceWidth > 500 ? _deviceHeight * 0.50 : _deviceHeight * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
                onSaved: (_value) {
                  setState(() {
                    _email = _value;
                  });
                },
                regEx:
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                hintText: 'E-mail',
                obscureText: false),
            CustomTextFormField(
                onSaved: (_value) {
                  _password = _value;
                },
                regEx: r".{8,}",
                hintText: 'Password',
                obscureText: true),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
      "Login",
      _deviceWidth > 500 ? _deviceHeight * 0.13 : _deviceHeight * 0.07,
      _deviceWidth > 500 ? _deviceHeight * 0.35 : _deviceWidth  * 0.60,
      () {
        if (_loginFormKey.currentState!.validate()) {
          _loginFormKey.currentState!.save();
        }
      },
    );
  }

  _registerAccountLink() {
    return GestureDetector(
      onTap: () {},
      child: const Text(
        'Don\'t have account? Click here!',
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
