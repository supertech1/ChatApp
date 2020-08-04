import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import './login_screen.dart';
import './registration_screen.dart';
import './AnimationController/controller.dart' as AnimationControllerHandler;
import '../widgets/custom_botton.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "images/logo.png",
                      width: control.value * 50,
                      height: 50,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ["Flash Chat"],
                    speed: Duration(seconds: 1),
                    displayFullTextOnTap: true,
                    isRepeatingAnimation: false,
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Custom_Botton(
                text: "Log in",
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                bgColor: Colors.lightBlueAccent,
              ),
              SizedBox(
                height: 25,
              ),
              Custom_Botton(
                text: "Register",
                onPress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                bgColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
