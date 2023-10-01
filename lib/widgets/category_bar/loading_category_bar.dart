import 'package:flutter/material.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';

class LoadingCategoryBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 10,
      margin: EdgeInsets.fromLTRB(
        SizeConfig.safeBlockHorizontal * 2.5,
        0,
        0,
        SizeConfig.safeBlockVertical * 2,
      ),
      child: LoadingListOfCategories(),
    );
  }
}

class LoadingListOfCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: White,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              height: SizeConfig.safeBlockVertical * 9,
              width: SizeConfig.safeBlockHorizontal * 20,
              margin: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal * 2.5,
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: WhiteLevel2,
                        shape: BoxShape.circle,
                      ),
                      height: SizeConfig.safeBlockVertical * 5,
                      width: SizeConfig.safeBlockHorizontal * 10,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 1,
                      width: SizeConfig.safeBlockHorizontal * 15,
                      decoration: BoxDecoration(
                        color: WhiteLevel2,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
