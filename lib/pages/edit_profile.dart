import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/models/user_model.dart';
import 'package:shamo_ecommerce/providers/auth_provider.dart';
import 'package:shamo_ecommerce/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel userModel = authProvider.userModel;

    PreferredSizeWidget _header() {
      return AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      );
    }

    Widget _nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: userModel.name,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@${userModel.username}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: userModel.email,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _content() {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: defaultMargin),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(userModel.urlPhoto.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _nameInput(),
              _usernameInput(),
              _emailInput(),
            ],
          ));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor3,
      appBar: _header(),
      body: SafeArea(child: _content()),
    );
  }
}
