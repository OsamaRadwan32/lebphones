import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';

class LoadingPhonesListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 67,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [PrimaryBlue, PrimaryDarkBlue],
      )),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: LoadingPhonesList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingPhonesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(PrimaryBlue);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return ListView.builder(
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            // height: SizeConfig.safeBlockVertical * 10,
            width: SizeConfig.safeBlockHorizontal * 80,
            margin: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 2,
              SizeConfig.safeBlockVertical * 1,
              SizeConfig.safeBlockHorizontal * 2,
              SizeConfig.safeBlockVertical * 0.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              color: WhiteLevel1,
            ),
            child: ListTile(
              // Phone Brand Image
              leading: Container(
                width: SizeConfig.safeBlockHorizontal * 10,
                height: SizeConfig.safeBlockVertical * 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: WhiteLevel2,
                ),
              ),
              // Phone Name and Specs
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: SizeConfig.safeBlockHorizontal * 42,
                      height: SizeConfig.safeBlockVertical * 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: WhiteLevel2,
                      ),
                    ),
                  ),
                ],
              ),
              // Phone Price and WhatsApp Button
              trailing: Container(
                width: SizeConfig.blockSizeHorizontal * 22,
                child: Row(
                  children: [
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 10,
                      height: SizeConfig.safeBlockVertical * 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: WhiteLevel2,
                      ),
                      margin: EdgeInsets.only(
                        right: SizeConfig.safeBlockHorizontal * 2,
                      ),
                    ),
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 10,
                      height: SizeConfig.safeBlockVertical * 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: WhiteLevel2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
