import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Duration duration = Duration(milliseconds: 3000);

  void transitScreen(BuildContext c) async {
    await Future.delayed(duration, () {
      Navigator.pushReplacementNamed(c, WelcomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    transitScreen(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SpinKitFoldingCube(
        color: Color(0xFFF6A24A),
        size: 50.0,
        controller: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 3000)),
      ),
    );
  }
}
