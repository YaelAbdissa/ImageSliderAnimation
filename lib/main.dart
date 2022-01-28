import 'package:flutter/material.dart';
import 'package:tinder_app/round_button.dart';
import 'package:tinder_app/tinde_home.dart';

import 'image_slider_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSliderAnimation(),
    );
  }
}
