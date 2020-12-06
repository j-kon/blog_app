import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/data_generator.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets.dart';
import 'package:blog_app/utils/widgets/button.dart';

class Detail extends StatefulWidget {
  static var tag = "/Description";

  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> {
  int selectedPos = 1;
  List<NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TopBar(lbl_single_article),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: img2,
                              width: (width - 48) * 0.5,
                              height: height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: img4,
                              width: (width - 48) * 0.5,
                              height: height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: text(samplelong_text,
                            textColor: textColorPrimary,
                            fontSize: textSizeMedium,
                            maxLine: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: divider(),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 12, bottom: 12, left: 16, right: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                        CachedNetworkImageProvider(profile),
                                    radius: 28,
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        text(username,
                                            textColor: textColorPrimary,
                                            fontSize: textSizeMedium,
                                            fontFamily: fontMedium),
                                        text(designation,
                                            fontSize: textSizeMedium)
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Button(
                              textContent: lbl_follow,
                              isStroked: true,
                              height: 40,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: text("Releted Articles",
                            textColor: textColorPrimary,
                            fontFamily: fontBold,
                            fontSize: textSizeNormal),
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: mListings.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          child: CachedNetworkImage(
                                            imageUrl: mListings[index].image,
                                            width: width / 3,
                                            height: width / 3.2,
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    text(mListings[index].name,
                                                        textColor:
                                                            textColorPrimary,
                                                        fontSize:
                                                            textSizeLargeMedium,
                                                        fontFamily: fontBold),
                                                    text(mListings[index].info,
                                                        fontSize:
                                                            textSizeMedium,
                                                        textColor:
                                                            textColorPrimary),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    text(
                                                        mListings[index]
                                                            .otherinfo,
                                                        fontSize:
                                                            textSizeSMedium,
                                                        maxLine: 3),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    divider()
                                  ],
                                ));
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
