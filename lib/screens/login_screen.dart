import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter_2025/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../components/roundedButton.dart';
import 'package:flash_chat_flutter_2025/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool _saving = false;

  Future<void> _login() async {
    if (email.trim().isEmpty || password.isEmpty) {
      print("not valid");
    }
    ;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    try {
                      if (value != null) {
                        email = value;
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Enter your email address')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Enter your password')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });
                  try {
                    final userCredential =
                        await _auth.signInWithEmailAndPassword(
                      email: email.trim(),
                      password: password,
                    );
                    if (userCredential.user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                      setState(() {
                        _saving = false;
                      });
                    } else {
                      print("sometzhing went wrong");
                    }
                  } catch (e) {
                    print('Login Error: $e');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
