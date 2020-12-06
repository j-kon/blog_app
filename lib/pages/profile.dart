import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/data_generator.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets.dart';

class Profile extends StatefulWidget {
  static var tag = "/Profile";

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  int selectedPos = 1;
  List<NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
  }

  Widget getItem(String name, String icon) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    icon,
                    width: 20,
                    height: 20,
                    color: colorPrimary,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  text(name, textColor: textColorPrimary)
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_right),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: divider(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(app_background);

    return Scaffold(
      backgroundColor: app_background,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(lbl_profile),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: boxDecoration(radius: 8, showShadow: true),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: profile_covr_page,
                          height: height * 0.3,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: height * 0.225,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  width: 24,
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: white),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        CachedNetworkImageProvider(profile),
                                    radius: width * 0.15,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(username,
                                        textColor: textColorPrimary,
                                        fontFamily: fontBold,
                                        fontSize: textSizeLargeMedium),
                                    text(designation,
                                        fontFamily: fontMedium,
                                        fontSize: textSizeMedium),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            getItem(lbl_offer, home),
                            getItem(lbl_notification, bell),
                            getItem(lbl_terms_conditions, file),
                            getItem(lbl_help_support, help),
                            getItem(lbl_logout, logout),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
