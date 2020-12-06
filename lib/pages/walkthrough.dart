import 'package:cached_network_image/cached_network_image.dart';
import 'package:blog_app/app/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets.dart';
import 'package:blog_app/utils/widgets/button.dart';

class WalkThrough extends StatefulWidget {
  static var tag = "/T4WalkThrough";

  @override
  WalkThroughState createState() => WalkThroughState();
}

class WalkThroughState extends State<WalkThrough> {
  int currentIndexPage = 0;

  PageController _controller = new PageController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
  }

  VoidCallback onPrev() {
    setState(() {
      if (currentIndexPage >= 1) {
        currentIndexPage = currentIndexPage - 1;
        _controller.jumpToPage(currentIndexPage);
      }
    });
  }

  VoidCallback onNext() {
    setState(() {
      if (currentIndexPage < 2) {
        currentIndexPage = currentIndexPage + 1;
        _controller.jumpToPage(currentIndexPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          walk_bg,
          width: width * 0.8,
          height: height * 0.5,
          fit: BoxFit.fill,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: _controller,
            children: <Widget>[
              WalkThrough1(textContent: latest_news_daily, walkImg: walk1),
              WalkThrough1(textContent: regularNotifications, walkImg: walk2),
              WalkThrough1(textContent: awardWinningApp, walkImg: walk3),
            ],
            onPageChanged: (value) {
              setState(() => currentIndexPage = value);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(child: Button(textContent: "Prev", onPressed: onPrev)),
                DotsIndicator(
                    dotsCount: 3,
                    position: currentIndexPage,
                    decorator: DotsDecorator(
                      color: view_color,
                      activeColor: colorPrimary,
                    )),
                Button(
                  textContent: "Next",
                  onPressed: onNext,
                  isStroked: true,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class WalkThrough1 extends StatelessWidget {
  final String textContent;
  final String walkImg;

  WalkThrough1({Key key, this.textContent, this.walkImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: h * 0.05),
            height: h * 0.5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: walkImg, width: width * 0.8, height: h * 0.4),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.08,
          ),
          text(textContent,
              textColor: textColorPrimary,
              fontSize: textSizeNormal,
              fontFamily: fontMedium),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28.0),
            child: text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.simply duumy text ",
                fontSize: textSizeMedium,
                maxLine: 3,
                isCentered: true),
          )
        ],
      ),
    );
  }
}
