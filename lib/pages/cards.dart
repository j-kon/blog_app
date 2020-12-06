import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/data_generator.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets.dart';

class Cards extends StatefulWidget {
  static var tag = "/Cards";

  @override
  CardsState createState() => CardsState();
}

class CardsState extends State<Cards> {
  int selectedPos = 1;
  List<NewsModel> mCardss;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mCardss = getDashboardData();
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
            TopBar(lbl_cards),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mCardss.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Stack(
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: mCardss[index].image,
                                  width: width - 32,
                                  height: width * 0.5,
                                  fit: BoxFit.cover,
                                ),
                                /*Image.asset(
                                  mCardss[index].image,
                                  width: width - 32,
                                  height: width * 0.5,
                                  fit: BoxFit.cover,
                                ),*/
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: colorPrimary,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: white),
                                )
                              ],
                              alignment: Alignment.center,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(mCardss[index].name,
                                        textColor: textColorPrimary,
                                        fontSize: textSizeLargeMedium,
                                        fontFamily: fontBold),
                                    text(mCardss[index].info,
                                        fontSize: textSizeMedium,
                                        textColor: textColorPrimary),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    heart,
                                    width: 22,
                                    height: 22,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  SvgPicture.asset(
                                    share,
                                    width: 22,
                                    height: 22,
                                    color: textColorPrimary,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
