import 'package:flutter/material.dart';

Animation controller(TickerProvider context, Function setState) {
  AnimationController control = AnimationController(
    vsync: context,
    duration: Duration(milliseconds: 2000),
  );
  Animation animation = CurvedAnimation(
      parent: control,
      curve: Curves
          .bounceOut); //NB: if you are using curves, the upperbound if set in the Animation controller must not be greater than 1
  control.forward();
  control.addListener(() {
    setState(() {});
  });
  return animation;
}

//This works as well, but the above uses curvedAimations which help the controller set the value speed dynamically with all the different types of curved animation

// AnimationController controller(TickerProvider context, Function setState) {
//   AnimationController control = AnimationController(
//     vsync: context,
//     duration: Duration(milliseconds: 2000),
//   );
//   control.forward();
//   control.addListener(() {
//     setState(() {});
//   });
//   return control;
// }
