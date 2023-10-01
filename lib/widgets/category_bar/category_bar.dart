import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';
import 'package:lebphones/models/lebphones_category.dart';

class CategoryBarContainer extends StatefulWidget {
  final List<LebPhonesCategory> displayedCategoryList;

  const CategoryBarContainer({
    Key key,
    this.displayedCategoryList,
  }) : super(key: key);
  @override
  _CategoryBarContainerState createState() => _CategoryBarContainerState();
}

class _CategoryBarContainerState extends State<CategoryBarContainer> {
  @override
  Widget build(BuildContext context) {
    List<LebPhonesCategory> _categoryList = widget.displayedCategoryList;
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 12,
      margin: EdgeInsets.fromLTRB(
        SizeConfig.safeBlockHorizontal * 2.5,
        0,
        0,
        SizeConfig.safeBlockVertical * 2,
      ),
      child: SizedBox(
          width: SizeConfig.safeBlockHorizontal * 100,
          height: SizeConfig.safeBlockVertical * 12,
          child: SliverListOfCategories(
            categoryList: _categoryList,
          )),
    );
  }
}

class SliverListOfCategories extends StatefulWidget {
  final List<LebPhonesCategory> categoryList;

  const SliverListOfCategories({
    Key key,
    @required this.categoryList,
  }) : super(key: key);

  @override
  _SliverListOfCategoriesState createState() => _SliverListOfCategoriesState();
}

class _SliverListOfCategoriesState extends State<SliverListOfCategories> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              LebPhonesCategory category = widget.categoryList[index];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  height: SizeConfig.safeBlockVertical * 10,
                  width: SizeConfig.safeBlockHorizontal * 20,
                  margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal * 2.5,
                  ),
                  decoration: BoxDecoration(
                    color: White,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0,
                          SizeConfig.blockSizeVertical * 1,
                          0,
                          SizeConfig.blockSizeVertical * 1,
                        ),
                        child: index == selectedCategory
                            ? SvgPicture.asset(
                                "assets/images/svg/brands/" +
                                    category.image +
                                    ".svg",
                              )
                            : SvgPicture.asset(
                                "assets/images/svg/brands/" +
                                    category.image +
                                    "Faded.svg",
                              ),
                        height: SizeConfig.safeBlockVertical * 5,
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                      Center(
                        child: Text(
                          category.categoryName,
                          style: TextStyle(
                            color: index == selectedCategory
                                ? Black
                                : Black.withOpacity(0.4),
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: widget.categoryList.length,
          ),
        ),
      ],
    );
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   // itemCount: categoryList.length,
    //   itemBuilder: (context, index) {
    //     return GestureDetector(
    //       onTap: () {
    //         setState(() {
    //           selectedCategory = index;
    //         });
    //       },
    //       child: Container(
    //         height: SizeConfig.safeBlockVertical * 10,
    //         width: SizeConfig.safeBlockHorizontal * 20,
    //         margin: EdgeInsets.only(
    //           right: SizeConfig.blockSizeHorizontal * 2.5,
    //         ),
    //         decoration: BoxDecoration(
    //           color: White,
    //           shape: BoxShape.rectangle,
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(15),
    //           ),
    //         ),
    //         child: Column(
    //           children: [
    //             Container(
    //               margin: EdgeInsets.fromLTRB(
    //                 0,
    //                 SizeConfig.blockSizeVertical * 1,
    //                 0,
    //                 SizeConfig.blockSizeVertical * 1,
    //               ),
    //               child: index == selectedCategory
    //                   ? SvgPicture.asset(
    //                       "assets/images/svg/brands/" +
    //                           _categoryList[index].image +
    //                           ".svg",
    //                     )
    //                   : SvgPicture.asset(
    //                       "assets/images/svg/brands/" +
    //                           _categoryList[index].image +
    //                           "Faded.svg",
    //                     ),
    //               height: SizeConfig.safeBlockVertical * 5,
    //               width: SizeConfig.safeBlockHorizontal * 10,
    //             ),
    //             Center(
    //               child: Text(
    //                 _categoryList[index].categoryName,
    //                 style: TextStyle(
    //                   color: index == selectedCategory
    //                       ? Black
    //                       : Black.withOpacity(0.4),
    //                   fontSize: SizeConfig.safeBlockHorizontal * 4,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
