import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/app/app_constant.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/widgets.dart';

class Button extends StatefulWidget {
  static String tag = '/Button';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;

  Button(
      {@required this.textContent,
      @required this.onPressed,
      this.isStroked = false,
      this.height = 45.0});

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked ? colorPrimary : white,
            isCentered: true,
            fontFamily: fontMedium,
            textAllCaps: true),
        decoration: widget.isStroked
            ? boxDecoration(bgColor: Colors.transparent, color: colorPrimary)
            : boxDecoration(bgColor: colorPrimary, radius: 4),
      ),
    );
  }
}
