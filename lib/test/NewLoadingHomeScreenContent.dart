import 'package:flutter/material.dart';
import 'package:lebphones/utilities/size_config.dart';
import 'package:lebphones/widgets/category_bar/loading_category_bar.dart';
import 'package:lebphones/widgets/lebPhones_list/loading_phones_list.dart';
import 'package:lebphones/widgets/search_bar/loading_search_bar.dart';

class NewLoadingHomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 95,
      child: Column(
        children: [
          LoadingSearchBar(),
          LoadingCategoryBarContainer(),
          LoadingPhonesListContainer(),
        ],
      ),
    );
  }
}
