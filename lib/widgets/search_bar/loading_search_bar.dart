import 'package:flutter/material.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/size_config.dart';

class LoadingSearchBar extends StatelessWidget {
  const LoadingSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 95,
      height: SizeConfig.safeBlockVertical * 8,
      margin: EdgeInsets.fromLTRB(
        0,
        SizeConfig.safeBlockVertical * 2,
        0,
        SizeConfig.safeBlockVertical * 2,
      ),
      child: TextFormField(
        // initialValue: widget.searchQuery,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockVertical * 4,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 4,
            SizeConfig.safeBlockVertical * 3,
            SizeConfig.safeBlockHorizontal * 4,
            SizeConfig.safeBlockVertical * 3,
          ),
          filled: true,
          hintText: "Loading . . .",
          hintStyle: TextStyle(
            color: Black.withOpacity(0.5),
            fontSize: SizeConfig.safeBlockVertical * 3,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Black.withOpacity(0.5),
            size: SizeConfig.safeBlockVertical * 3,
          ),
          fillColor: White,
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
