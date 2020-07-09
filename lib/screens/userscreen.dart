import 'dart:io';

import 'package:bishkekevents/styles/colors.dart';
import 'package:bishkekevents/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bishkekevents/blocs/auth_bloc.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return pageBody(context);
  }

  Widget pageBody(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: AppColors.black,
            child: (Platform.isIOS)
                ? Icon(CupertinoIcons.add, color: Colors.white, size: 35.0)
                : Icon(Icons.add, color: Colors.white, size: 35.0),
          ),
          onTap: () => Navigator.of(context).pushNamed('/editproduct'),
        ),
        SizedBox(height: 20),
        (Platform.isIOS)
            ? CupertinoButton(
                child: Text('Выйти из аккаунта'),
                onPressed: () => authBloc.logout(),
              )
            : FlatButton(
                child: Text('Выйти из аккаунта'),
                onPressed: () => authBloc.logout(),
              ),
      ],
    );
  }
}
