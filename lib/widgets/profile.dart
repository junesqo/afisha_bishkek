//import 'package:bishkekevents/blocs/auth_bloc.dart';
//import 'package:bishkekevents/styles/colors.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'dart:io';
//
//import 'package:provider/provider.dart';
//
//class Profile extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    if (Platform.isIOS) {
//      return CupertinoPageScaffold(
//        child: pageBody(context),
//      );
//    } else {
//      return Scaffold(
//        body: pageBody(context),
//      );
//    }
//  }
//
//  Widget pageBody(BuildContext context) {
//    var authBloc = Provider.of<AuthBloc>(context);
//    return Column(
//      children: <Widget>[
//        GestureDetector(
//          child: Container(
//            height: 50.0,
//            width: double.infinity,
//            color: AppColors.black,
//            child: (Platform.isIOS)
//                ? Icon(CupertinoIcons.add, color: Colors.white, size: 35.0)
//                : Icon(Icons.add, color: Colors.white, size: 35.0),
//          ),
//          onTap: () => Navigator.of(context).pushNamed('/editproduct'),
//        ),
//        (Platform.isIOS)
//            ? CupertinoButton(
//                child: Text('Logout'),
//                onPressed: () => authBloc.logout(),
//              )
//            : FlatButton(
//                child: Text('Logout'),
//                onPressed: () => authBloc.logout(),
//              ),
//      ],
//    );
//  }
//}
