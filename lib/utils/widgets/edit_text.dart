import 'package:flutter/material.dart';
import 'package:blog_app/utils/colors.dart';
import '../constant.dart';

class T4EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var hint;
  var maxLine;
  TextEditingController mController;

  VoidCallback onPressed;

  T4EditText(
      {var this.fontSize = textSizeNormal,
      var this.textColor = textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = true,
      var this.hint = "",
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return T4EditTextState();
  }
}

class T4EditTextState extends State<T4EditText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.mController,
      obscureText: widget.isPassword,
      style: TextStyle(
          fontSize: textSizeLargeMedium,
          fontFamily: fontRegular,
          color: white),
      decoration: InputDecoration(
        suffixIcon: widget.isSecure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isPassword = !widget.isPassword;
                  });
                },
                child: new Icon(
                  widget.isPassword ? Icons.visibility : Icons.visibility_off,
                  color: white,
                ),
              )
            : null,
        contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        hintText: widget.hint,
        hintStyle: TextStyle(color: white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: white, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: white, width: 0.5),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}
