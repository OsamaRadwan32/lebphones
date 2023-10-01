import 'package:flutter/material.dart';
import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/services/lebphones_category_services.dart';
import 'package:lebphones/widgets/home_screen/home_screen.dart';
import 'package:lebphones/widgets/home_screen/loading_home_screen.dart';
import 'utilities/constants.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/services/lebphones_phone_services.dart';
import 'package:lebphones/utilities/size_config.dart';

class HomeScreenContainer extends StatefulWidget {
  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
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

    return FutureBuilder(
      future: Future.wait(
        [
          lebPhonesCategoryList,
          lebPhonesList,
        ],
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? HomeScreen(
                searchQuery: '',
                categoryList: snapshot.data[0],
                phonesList: snapshot.data[1],
              )
            : LoadingHomeScreen();
      },
    );
  }
}
