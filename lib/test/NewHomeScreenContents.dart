import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/utilities/constants.dart';
import 'package:lebphones/utilities/flutter_utilities.dart';
import 'package:lebphones/utilities/size_config.dart';

class NewHomeScreenContent extends StatefulWidget {
  final List<LebPhonesPhone> providedPhonesList;
  final List<LebPhonesCategory> categoryList;

  const NewHomeScreenContent({
    Key key,
    @required this.providedPhonesList,
    @required this.categoryList,
  }) : super(key: key);

  @override
  _NewHomeScreenContentState createState() => _NewHomeScreenContentState();
}

class _NewHomeScreenContentState extends State<NewHomeScreenContent> {
  FocusNode _currentFocus = new FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  List<LebPhonesPhone> displayedPhonesList = [];
  int selectedCategory = 0;

  @override
  void initState() {
    addAllPhonesCategory();
    displayedPhonesList.addAll(widget.providedPhonesList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<LebPhonesPhone> providedPhonesList = widget.providedPhonesList;
    if (query.isNotEmpty) {
      List<LebPhonesPhone> dummyListData = [];
      providedPhonesList.forEach((phone) {
        if (phone.newName.toLowerCase().contains(query)) {
          dummyListData.add(phone);
        }
      });
      setState(() {
        displayedPhonesList.clear();
        displayedPhonesList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        displayedPhonesList.clear();
        displayedPhonesList.addAll(widget.providedPhonesList);
      });
    }
  }

  clearTextInput() {
    _textEditingController.clear();
  }

  void filterByCategory(String selectedCategory) {
    List<LebPhonesPhone> providedPhonesList = widget.providedPhonesList;
    if (selectedCategory == "All Phones") {
      setState(() {
        displayedPhonesList.clear();
        displayedPhonesList.addAll(providedPhonesList);
      });
      return;
    } else if (selectedCategory.isNotEmpty) {
      List<LebPhonesPhone> dummyListData = [];
      providedPhonesList.forEach((phone) {
        if (phone.category.contains(selectedCategory)) {
          dummyListData.add(phone);
        }
      });
      setState(() {
        displayedPhonesList.clear();
        displayedPhonesList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        displayedPhonesList.clear();
        displayedPhonesList.addAll(widget.providedPhonesList);
      });
    }
  }

  addAllPhonesCategory() {
    LebPhonesCategory allPhonesCategory = new LebPhonesCategory();
    allPhonesCategory.id = widget.categoryList.length + 1;
    allPhonesCategory.id = 0;
    allPhonesCategory.categoryName = "All Phones";
    allPhonesCategory.image = "All Phones";
    widget.categoryList.insert(0, allPhonesCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 95,
      child: Column(
        children: [
          // Search Bar
          Container(
            width: SizeConfig.safeBlockHorizontal * 95,
            height: SizeConfig.safeBlockVertical * 8,
            margin: EdgeInsets.fromLTRB(
              0,
              SizeConfig.safeBlockVertical * 2,
              0,
              SizeConfig.safeBlockVertical * 2,
            ),
            child: TextFormField(
              onChanged: (value) {
                filterSearchResults(value.toLowerCase());
              },
              focusNode: _currentFocus,
              controller: _textEditingController,
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
                hintText: "Search for a Phone . . .",
                hintStyle: TextStyle(
                  color: _currentFocus.hasFocus
                      ? PrimaryBlue
                      : Black.withOpacity(0.5),
                  fontSize: _currentFocus.hasFocus
                      ? SizeConfig.safeBlockVertical * 3
                      : SizeConfig.safeBlockVertical * 2,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: _currentFocus.hasFocus
                      ? PrimaryBlue
                      : Black.withOpacity(0.5),
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
          ),
          // Category Bar
          Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 10,
            margin: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 2.5,
              0,
              0,
              SizeConfig.safeBlockVertical * 2,
            ),
            child: SizedBox(
              width: SizeConfig.safeBlockHorizontal * 100,
              height: SizeConfig.safeBlockVertical * 10,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        List<LebPhonesCategory> categoryList =
                            widget.categoryList;
                        LebPhonesCategory category = categoryList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              clearTextInput();
                              selectedCategory = index;
                              filterByCategory(category.categoryName);
                            });
                          },
                          child: Container(
                            height: SizeConfig.safeBlockVertical * 8,
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
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 3,
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
              ),
            ),
          ),
          // Phones List
          Container(
            height: SizeConfig.safeBlockVertical * 67,
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
                      child: CustomScrollView(
                        // shrinkWrap: true,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                LebPhonesPhone phone =
                                    displayedPhonesList[index];
                                return ListTile(
                                  leading: Container(
                                    child: SvgPicture.asset(
                                      "assets/images/svg/brands/" +
                                          phone.image +
                                          ".svg",
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
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle:
                                      Container(child: Text(phone.category)),
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
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        4.5,
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
                                                  FlutterUtilities.openWhatsApp(
                                                      phone.newName);
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
                              childCount: displayedPhonesList.length,
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: SizeConfig.safeBlockVertical * 13,
                                width: SizeConfig.safeBlockHorizontal * 95,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "A product of SIMPhones.\n"
                                            "Developed and Released by Khawarizmiyat.",
                                            style:
                                                TextStyle(color: PrimaryBlue),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          child: SvgPicture.asset(
                                            "assets/images/svg/icons/SIMPhonesLogo.svg",
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    4,
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    4,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          child: SvgPicture.asset(
                                            "assets/images/svg/icons/KhawarizmiyatLogo.svg",
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    4,
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
