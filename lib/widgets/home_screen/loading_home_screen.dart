import 'package:flutter/material.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';
import 'package:lebphones/widgets/category_bar/loading_category_bar.dart';
import 'package:lebphones/widgets/lebPhones_list/loading_phones_list.dart';
import 'package:lebphones/widgets/search_bar/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingHomeScreen extends StatelessWidget {
  const LoadingHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PrimaryBlue,
      appBar: AppBar(
        backgroundColor: PrimaryBlue,
        elevation: 0,
        toolbarHeight: SizeConfig.safeBlockVertical * 9,
        title: Center(
          child: Container(
            child: SvgPicture.asset(
              "assets/images/svg/icons/LebPhonesLogoWhite.svg",
              width: SizeConfig.safeBlockHorizontal * 50,
            ),
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.safeBlockVertical * 95,
        child: Column(
          children: [
            SearchBar(
              searchQuery: '',
              searchList: [],
              categoryList: [],
            ),
            LoadingCategoryBarContainer(),
            LoadingPhonesListContainer(),
          ],
        ),
      ),
    );
  }
}
