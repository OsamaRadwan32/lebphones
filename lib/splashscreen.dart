import 'package:lebphones/test/NewHomeScreen.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'dart:async';
import 'package:lebphones/utilities/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NewHomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(White);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: White,
      body: Container(
        height: SizeConfig.safeBlockVertical * 100,
        // color: PrimaryDarkBlue,
        child: Column(
          children: [
            Container(
              height: SizeConfig.safeBlockVertical * 70,
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/svg/icons/LebPhonesLogo.svg",
                  width: SizeConfig.safeBlockHorizontal * 60,
                ),
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 30,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 10,
                      color: White,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                      0,
                      SizeConfig.safeBlockVertical * 2,
                      0,
                      0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "A product of SIMPhones.\n"
                          "Developed and Released by Khawarizmiyat.",
                          style: TextStyle(
                            color: PrimaryBlue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/svg/icons/SIMPhonesLogo.svg",
                          width: SizeConfig.safeBlockHorizontal * 4,
                          height: SizeConfig.safeBlockVertical * 4,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: SvgPicture.asset(
                          "assets/images/svg/icons/KhawarizmiyatLogo.svg",
                          width: SizeConfig.safeBlockHorizontal * 4,
                          height: SizeConfig.safeBlockVertical * 4,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 10,
                      color: White,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
