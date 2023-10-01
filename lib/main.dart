import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/splashscreen.dart';
import 'package:lebphones/utilities/portrait_mode_mixin.dart';

void main() {
  FlutterStatusbarcolor.setStatusBarColor(PrimaryBlue);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  runApp(
    Lebphones(),
  );
}

class Lebphones extends StatelessWidget with PortraitModeMixin {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(White);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimPhones',
      theme: ThemeData(fontFamily: 'Pastika'),
      home: SplashScreen(),
    );
  }
}
