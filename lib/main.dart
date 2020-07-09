import 'package:bishkekevents/blocs/auth_bloc.dart';
import 'package:bishkekevents/blocs/product_bloc.dart';
import 'package:bishkekevents/routes.dart';
import 'package:bishkekevents/screens/landing.dart';
import 'package:bishkekevents/screens/login.dart';
import 'package:bishkekevents/services/firestore_service.dart';
import 'package:bishkekevents/styles/colors.dart';
import 'package:bishkekevents/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

final authBloc = AuthBloc();
final productBloc = ProductBloc();
final firestoreService = FirestoreService();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => authBloc),
      Provider(create: (context) => productBloc),
      FutureProvider(
        create: (context) => authBloc.isLoggedIn(),
        catchError: (context, error) {
          print(error.toString());
        },
      ),
      StreamProvider(create: (context) => firestoreService.fetchUnitTypes())
    ], child: PlatformApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
    productBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = Provider.of<bool>(context);

    if (Platform.isIOS) {
      return CupertinoApp(
          home: (isLoggedIn == null)
              ? loadingScreen(true)
              : (isLoggedIn == true) ? Landing() : Login(),
          onGenerateRoute: Routes.cupertinoRoutes,
          theme: CupertinoThemeData(
              primaryColor: AppColors.straw,
              scaffoldBackgroundColor: Colors.white,
              textTheme: CupertinoTextThemeData(
                  tabLabelTextStyle: TextStyles.suggestion)));
    } else {
      return MaterialApp(
          home: (isLoggedIn == null)
              ? loadingScreen(false)
              : (isLoggedIn == true) ? Landing() : Login(),
          onGenerateRoute: Routes.materialRoutes,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white));
    }
  }

  Widget loadingScreen(bool isIOS) {
    return (isIOS)
        ? CupertinoPageScaffold(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
