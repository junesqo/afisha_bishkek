import 'package:bishkekevents/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:bishkekevents/helper/colorsys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bishkekevents/screens/home_screen.dart';
import 'SignUp/signin.dart';
import 'SignUp/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return StreamProvider<User>.value(
//      value: AuthService().currentUser,
    return MaterialApp(
      title: 'Афиша Бишкека',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colorsys.pink,
          accentColor: Color(0xFF2A2D40),
          scaffoldBackgroundColor: Color(0xFFEBE8E5),
          fontFamily: 'Jost'),
      home: MyHomePage(),
//      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool _isLogin = false;

  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = (prefs.get('isLogin') ?? false);

    setState(() {
      _isLogin = isLogin;
    });
  }

  // Upadte Loading value from signin class.
  // If the user try to signin. show loading in this view.
  _updateLoadingStatus(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLogin ? _signInWidget() : Home();
  }

  Widget _signInWidget() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  mainLogo(),
                  SignIn(_updateLoadingStatus), // connecting with child view.
                  SignUp(_updateLoadingStatus)
                ],
              ),
            ),
          ),
          Positioned(
            // Loading view in the center.
            child: isLoading
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                    color: Colors.white.withOpacity(0.7),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
