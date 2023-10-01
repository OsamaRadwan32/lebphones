import 'package:flutter/material.dart';
import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/utilities/size_config.dart';
import 'package:lebphones/widgets/home_screen/home_screen.dart';

class SearchBar extends StatefulWidget {
  final String searchQuery;
  final List<LebPhonesPhone> searchList;
  final List<LebPhonesCategory> categoryList;

  SearchBar({
    Key key,
    @required this.searchQuery,
    @required this.searchList,
    @required this.categoryList,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode myFocusNode = new FocusNode();
  TextEditingController _editingController = TextEditingController();
  List<LebPhonesPhone> phonesList = [];

  @override
  void initState() {
    phonesList.addAll(widget.searchList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<LebPhonesPhone> dummySearchList = [];
    dummySearchList.addAll(widget.searchList);
    if (query.isNotEmpty) {
      List<LebPhonesPhone> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.newName.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        phonesList.clear();
        phonesList.addAll(dummyListData);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(
                  searchQuery: widget.searchQuery,
                  categoryList: widget.categoryList,
                  phonesList: phonesList,
                )));
      });
      return;
    } else {
      setState(() {
        phonesList.clear();
        phonesList.addAll(widget.searchList);
      });
    }
  }

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
        initialValue: widget.searchQuery,
        onChanged: (value) {
          filterSearchResults(value.toLowerCase());
        },
        focusNode: myFocusNode,
        controller: _editingController,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockVertical * 4,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 4,
            SizeConfig.safeBlockVertical * 3,
            SizeConfig.safeBlockHorizontal * 4,
            SizeConfig.safeBlockVertical * 2,
          ),
          filled: true,
          hintText: "Search for a Phone . . .",
          hintStyle: TextStyle(
            color: myFocusNode.hasFocus ? PrimaryBlue : Black.withOpacity(0.5),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: myFocusNode.hasFocus ? PrimaryBlue : Black.withOpacity(0.5),
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
