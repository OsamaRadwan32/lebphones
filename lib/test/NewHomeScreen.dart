import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/services/lebphones_category_services.dart';
import 'package:lebphones/services/lebphones_phone_services.dart';
import 'package:lebphones/test/NewHomeScreenContents.dart';
import 'package:lebphones/test/NewLoadingHomeScreenContent.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';

class NewHomeScreen extends StatefulWidget {
  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @required
  Future<List<LebPhonesCategory>> lebPhonesCategoryList;
  @required
  Future<List<LebPhonesPhone>> lebPhonesList;

  @override
  void initState() {
    super.initState();
    lebPhonesCategoryList = _getCategories();
    lebPhonesList = _getLebPhones();
  }

  Future<List<LebPhonesCategory>> _getCategories() async {
    return await LebPhonesCategoryServices.getCategories();
  }

  Future<List<LebPhonesPhone>> _getLebPhones() async {
    return await LebPhonesPhoneServices.getLebPhones();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    FlutterStatusbarcolor.setStatusBarColor(PrimaryBlue);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PrimaryBlue,
      appBar: AppBar(
        backgroundColor: PrimaryBlue,
        elevation: 0,
        toolbarHeight: SizeConfig.safeBlockVertical * 9,
        title: Center(
          child: SvgPicture.asset(
            "assets/images/svg/icons/LebPhonesLogoWhite.svg",
            width: SizeConfig.safeBlockHorizontal * 50,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Future.wait(
          [
            lebPhonesCategoryList,
            lebPhonesList,
          ],
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? NewHomeScreenContent(
                  categoryList: snapshot.data[0],
                  providedPhonesList: snapshot.data[1],
                )
              : NewLoadingHomeScreenContent();
        },
      ),
    );
  }
}
