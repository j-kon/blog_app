import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/extension.dart';
import 'package:blog_app/utils/images.dart';
import 'package:blog_app/utils/strings.dart';
import 'package:blog_app/utils/widgets/button.dart';
import 'package:blog_app/utils/widgets/edit_text.dart';

class SignUp extends StatefulWidget {
  static String tag = '/SignUp';

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
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
                    CachedNetworkImage(
                      imageUrl: icon,
                      width: width / 3.2,
                      color: white,
                    ),
                    SizedBox(height: 40),
                    T4EditText(
                      hint: hint_name,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(
                      hint: hint_phone,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(
                      hint: hint_Email,
                      isPassword: false,
                    ),
                    SizedBox(height: 24),
                    T4EditText(hint: hint_password, isSecure: true),
                    SizedBox(height: 24),
                    Button(
                      textContent: lbl_register_now,
                      onPressed: () {},
                    ),
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
