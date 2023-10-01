import 'package:flutter/material.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/utilities/flutter_utilities.dart';
import 'package:lebphones/utilities/size_config.dart';

class PhoneListContainer extends StatefulWidget {
  final List<LebPhonesPhone> lebPhonesList;

  const PhoneListContainer({Key key, @required this.lebPhonesList})
      : super(key: key);
  @override
  _PhoneListContainerState createState() => _PhoneListContainerState();
}

class _PhoneListContainerState extends State<PhoneListContainer> {
  @override
  Widget build(BuildContext context) {
    List<LebPhonesPhone> _lebPhonesList = widget.lebPhonesList;
    return Container(
      height: SizeConfig.safeBlockVertical * 65,
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
                child: SliverPhonesList(lebPhonesList: _lebPhonesList),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverPhonesList extends StatelessWidget {
  final List<LebPhonesPhone> lebPhonesList;

  const SliverPhonesList({
    Key key,
    @required this.lebPhonesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // shrinkWrap: true,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              LebPhonesPhone phone = lebPhonesList[index];
              return ListTile(
                leading: Container(
                  child: SvgPicture.asset(
                    "assets/images/svg/brands/" + phone.image + ".svg",
                    width: SizeConfig.safeBlockHorizontal * 8,
                  ),
                ),
                title: Container(
                  width: SizeConfig.safeBlockHorizontal * 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          phone.newName,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Container(child: Text(phone.category)),
                trailing: Container(
                  width: SizeConfig.safeBlockHorizontal * 30,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                "${phone.finalPrice}\$",
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.5,
                                  fontWeight: FontWeight.w600,
                                  color: PrimaryBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: MaterialButton(
                              child: SvgPicture.asset(
                                "assets/images/svg/icons/whatsApp.svg",
                                color: WhatsAppGreen,
                              ),
                              onPressed: () {
                                FlutterUtilities.openWhatsApp(phone.newName);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: lebPhonesList.length,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: SliverListOfPhonesFooter(),
        ),
      ],
    );
  }
}

class SliverListOfPhonesFooter extends StatelessWidget {
  const SliverListOfPhonesFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(PrimaryBlue);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return Container(
      width: MediaQuery.of(context).size.width * 0.96,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A product of SIMPhones.\n"
                  "Developed and Released by Khawarizmiyat.",
                  style: TextStyle(color: PrimaryBlue),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SvgPicture.asset(
                  "assets/images/svg/icons/SIMPhonesLogo.svg",
                  width: SizeConfig.safeBlockHorizontal * 4,
                  height: SizeConfig.safeBlockVertical * 4,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SvgPicture.asset(
                  "assets/images/svg/icons/KhawarizmiyatLogo.svg",
                  width: SizeConfig.safeBlockHorizontal * 4,
                  height: SizeConfig.safeBlockVertical * 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
