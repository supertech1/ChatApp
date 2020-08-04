import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './AnimationController/controller.dart' as AnimationControllerHandler;
import '../widgets/custom_botton.dart';
import '../widgets/custom_textfield.dart';
import '../screens/chat_screen.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  String email, password, errMsg = "";
  bool show_spinner = false;
  final _auth = FirebaseAuth.instance;

  Animation control;
  @override
  void initState() {
    super.initState();
    control = AnimationControllerHandler.controller(this, setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    "images/logo.png",
                    width: control.value * 100,
                    height: control.value * 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (val) {
                    email = val;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Email address"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (val) {
                    password = val;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: "Password"),
                ),
                SizedBox(
                  height: 30,
                ),
                Custom_Botton(
                  text: "Log in",
                  bgColor: Colors.lightBlueAccent,
                  onPress: () async {
                    setState(() {
                      show_spinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        show_spinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        errMsg = "Invalid Credentials";
                        show_spinner = false;
                      });
                      print(e);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  errMsg,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
