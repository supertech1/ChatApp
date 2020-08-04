import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './AnimationController/controller.dart' as AnimationControllerHandler;
import '../widgets/custom_botton.dart';
import '../widgets/custom_textfield.dart';
import '../screens/chat_screen.dart';
import '../constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  Animation control;

  final _auth = FirebaseAuth.instance;
  String email, password;
  bool show_spinner = false;
  String errMsg = "";

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
                  keyboardType: TextInputType.emailAddress,
                  // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (val) {
                    password = val;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 30,
                ),
                Custom_Botton(
                  text: "Register",
                  bgColor: Colors.lightBlueAccent,
                  onPress: () async {
                    setState(() {
                      show_spinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        show_spinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        errMsg = "Unable to register user";
                        show_spinner = false;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  errMsg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
