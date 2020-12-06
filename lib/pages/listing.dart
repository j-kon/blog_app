import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/data_generator.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets.dart';

class Listing extends StatefulWidget {
  static var tag = "/Listing";

  @override
  ListingState createState() => ListingState();
}

class ListingState extends State<Listing> {
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
    changeStatusColor(app_background);

    return Scaffold(
      backgroundColor: app_background,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(lbl_listing),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            text(mListings[index].name,
                                                textColor: textColorPrimary,
                                                fontSize: textSizeLargeMedium,
                                                fontFamily: fontBold),
                                            text(mListings[index].info,
                                                fontSize: textSizeMedium,
                                                textColor: textColorPrimary),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            text(mListings[index].otherinfo,
                                                fontSize: textSizeSMedium,
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
                  }),
            )
          ],
        ),
      ),
    );
  }
}
