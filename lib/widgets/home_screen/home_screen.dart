import 'package:flutter/material.dart';
import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';
import 'package:lebphones/widgets/category_bar/category_bar.dart';
import 'package:lebphones/widgets/lebPhones_list/phones_list.dart';
import 'package:lebphones/widgets/search_bar/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  final String searchQuery;
  final List<LebPhonesCategory> categoryList;
  final List<LebPhonesPhone> phonesList;

  const HomeScreen({
    Key key,
    @required this.searchQuery,
    @required this.categoryList,
    @required this.phonesList,
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
              searchQuery: searchQuery,
              searchList: phonesList,
              categoryList: categoryList,
            ),
            CategoryBarContainer(displayedCategoryList: categoryList),
            PhoneListContainer(lebPhonesList: phonesList),
          ],
        ),
      ),
    );
  }
}
