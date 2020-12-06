import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blog_app/app/app_constant.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets.dart';
import 'package:blog_app/utils/widgets/button.dart';
import 'package:blog_app/utils/widgets/edit_text.dart';

class SignIn extends StatefulWidget {
  static String tag = '/SignIn';

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: bg,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Color(0XD5160336), Color(0XD5160336)]),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 24, right: 24, top: height * 0.1),
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(imageUrl: icon, width: width / 3.2),
                    SizedBox(height: 40),
                    T4EditText(hint: hint_Email, isPassword: false),
                    SizedBox(height: 24),
                    T4EditText(hint: hint_password, isSecure: true),
                    SizedBox(height: 24),
                    Button(
                      textContent: lbl_login,
                      onPressed: () {},
                    ),
                    SizedBox(height: 48),
                    text(lbl_login_with,
                        textColor: white,
                        fontFamily: fontMedium,
                        fontSize: textSizeLargeMedium),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: width / 7,
                          height: width / 7,
                          padding: EdgeInsets.all(width / 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                          ),
                          child: SvgPicture.asset(google, color: form_google),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          width: width / 7,
                          height: width / 7,
                          padding: EdgeInsets.all(width / 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                          ),
                          child: SvgPicture.asset(fb, color: form_facebook),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
