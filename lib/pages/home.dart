import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/data_generator.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/widgets.dart';
import 'package:blog_app/utils/widgets/bottom_navigationbar.dart';

class Home extends StatefulWidget {
  static var tag = "/Home";

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedPos = 1;
  List<NewsModel> mCategories;
  List<NewsModel> mHorizontalListings;
  List<NewsModel> mListings;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getDashboardData();
    mCategories = getCategoryData();
    mHorizontalListings = getList2Data();

    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(app_background);

    return Scaffold(
      backgroundColor: app_background,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopBar("Home"),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: width,
                      height: width * 0.1,
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mCategories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              margin: index == mCategories.length - 1
                                  ? EdgeInsets.only(left: 16, right: 16)
                                  : EdgeInsets.only(left: 16),
                              alignment: Alignment.center,
                              decoration: boxDecoration(
                                  radius: 4, bgColor: mCategories[index].color),
                              child: text(mCategories[index].category,
                                  textColor: white, fontFamily: fontMedium),
                            );
                          }),
                    ),
                    Container(
                      width: width,
                      height: width * 0.67,
                      margin: EdgeInsets.only(top: 22),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mHorizontalListings.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: index == mHorizontalListings.length - 1
                                  ? EdgeInsets.only(left: 16, right: 16)
                                  : EdgeInsets.only(left: 16),
                              alignment: Alignment.topLeft,
                              width: width * 0.8,
                              child: Column(
                                children: <Widget>[
                                  ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          mHorizontalListings[index].image,
                                      height: width * 0.5,
                                      width: width * 0.8,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              text(
                                                  mHorizontalListings[index]
                                                      .name,
                                                  textColor:
                                                      textColorPrimary,
                                                  fontSize: textSizeLargeMedium,
                                                  fontFamily: fontBold),
                                              text(
                                                  mHorizontalListings[index]
                                                      .info,
                                                  fontSize: textSizeMedium,
                                                  textColor:
                                                      textColorPrimary),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              heart,
                                              width: 24,
                                              height: 24,
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            SvgPicture.asset(
                                              share,
                                              width: 24,
                                              height: 24,
                                              color: textColorPrimary,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        primary: false,
                        padding: EdgeInsets.only(bottom: 30),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        shrinkWrap: true,
                        staggeredTileBuilder: (index) =>
                            new StaggeredTile.fit(2),
                        itemCount: mListings.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          margin: EdgeInsets.only(
                              left: 4, bottom: 4, right: 4, top: 4),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: mListings[index].image,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              text(mListings[index].name,
                                  textColor: textColorPrimary,
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontBold),
                              text(mListings[index].info,
                                  fontSize: textSizeMedium,
                                  textColor: textColorPrimary),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: shadow_color,
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: T4BottomNavigationBar(
          items: const <T4BottomNavigationBarItem>[
            T4BottomNavigationBarItem(
              icon: home,
            ),
            T4BottomNavigationBarItem(
              icon: playbutton,
            ),
            T4BottomNavigationBarItem(
              icon: heart,
            ),
            T4BottomNavigationBarItem(
              icon: user,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme:
              IconThemeData(color: textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T4BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
