import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/data_generator.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/widgets.dart';

class ImageSlider extends StatefulWidget {
  static var tag = "/ImageSlider";

  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
  List<NewsModel> mHorizontalListings;

  @override
  void initState() {
    super.initState();
    mHorizontalListings = getList2Data();
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
            TopBar("ImageSlider"),
            Container(
              width: width,
              height: height * 0.37,
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
                              imageUrl: mHorizontalListings[index].image,
                              height: height * 0.28,
                              width: width * 0.8,
                              fit: BoxFit.fill,
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
                                    text(mHorizontalListings[index].name,
                                        textColor: textColorPrimary,
                                        fontSize: textSizeLargeMedium,
                                        fontFamily: fontBold),
                                    text(mHorizontalListings[index].info,
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
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
