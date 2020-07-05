//import 'package:bishkekevents/models/user.dart';
//import 'package:bishkekevents/services/auth.dart';
//import 'package:flutter/material.dart';
//import 'package:bishkekevents/main.dart';
//import 'package:bishkekevents/helper/colorsys.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//
//class AuthorizationPage extends StatefulWidget {
//  AuthorizationPage({Key key}) : super(key: key);
//
//  @override
//  _AuthorizationPageState createState() => _AuthorizationPageState();
//}
//
////
//class _AuthorizationPageState extends State<AuthorizationPage> {
////  TextEditingController _emailController = TextEditingController();
////  TextEditingController _passwordController = TextEditingController();
////
////  String _email;
////  String _password;
////  bool showLogin = true;
////
////  AuthService _authService = AuthService();
////
//  final emailTextController = TextEditingController();
//  final passwordTextController = TextEditingController();
//
//  @override
//  void dispose() {
//    emailTextController.dispose();
//    passwordTextController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Widget _logo() {
//      return Padding(
//        padding: EdgeInsets.only(top: 76),
//        child: Container(
//          child: Align(
//            child: Text(
//              'Афиша Бишкека',
//              style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.w700,
//                  fontFamily: 'Jost'),
//            ),
//          ),
//        ),
//      );
//    }
//
////    Widget _input(Icon icon, String hint, TextEditingController controller,
////        bool obsecure) {
////      return Container(
////        height: 56,
////        padding: EdgeInsets.symmetric(horizontal: 12),
////        child: TextField(
////          controller: controller,
////          obscureText: obsecure,
////          style: TextStyle(fontSize: 16, color: Colors.black),
////          decoration: InputDecoration(
////              hintStyle: TextStyle(
////                  fontWeight: FontWeight.w600,
////                  fontSize: 16,
////                  color: Colorsys.lightGrey),
////              hintText: hint,
////              focusedBorder: OutlineInputBorder(
////                borderRadius: BorderRadius.circular(32),
////                borderSide: BorderSide(color: Colorsys.grey, width: 2),
////              ),
////              enabledBorder: OutlineInputBorder(
////                borderRadius: BorderRadius.circular(32),
////                borderSide: BorderSide(color: Colorsys.lightGrey, width: 1),
////              ),
////              prefixIcon: Padding(
////                padding: EdgeInsets.only(left: 8, right: 8),
////                child: IconTheme(
////                  data: IconThemeData(color: Colorsys.grey),
////                  child: icon,
////                ),
////              )),
////        ),
////      );
////    }
////
////    Widget _button(String text, void func()) {
////      //дизайн кнопки войти/зарегаться
////      return RaisedButton(
////        splashColor: Colorsys.pink,
////        highlightColor: Colorsys.pink,
////        shape:
////            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
////        color: Colors.white,
////        child: Text(text,
////            style: TextStyle(
////                fontWeight: FontWeight.w600,
////                color: Colors.black,
////                fontSize: 20)),
////        onPressed: () {
////          func();
////        },
////      );
////    }
////
////    Widget _form(String label, void func()) {
////      //дизайн форм для ввода
////      return Container(
////        child: Column(
////          children: <Widget>[
////            Padding(
////              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
////              child: _input(Icon(Icons.email, size: 20), 'Email',
////                  _emailController, false),
////            ),
//////            SizedBox(height: 20),
////            Padding(
////              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
////              child: _input(Icon(Icons.lock, size: 20), 'Пароль',
////                  _passwordController, true),
////            ),
//////            SizedBox(height: 32),
////            Padding(
////              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
////              child: Container(
////                height: 50,
////                width: MediaQuery.of(context).size.width,
////                child: _button(label, func),
////              ),
////            ),
////          ],
////        ),
////      );
////    }
////
////    void _loginButtonAction() async {
////      _email = _emailController.text;
////      _password = _passwordController.text;
////
////      if (_email.isEmpty || _password.isEmpty) return;
////
////      User user = await _authService.signInWithEmailAndPassword(
////          _email.trim(), _password.trim());
////      if (user == null) {
////        Fluttertoast.showToast(
////            msg:
////                "Вы не можете войти! Пожалуйста, проверьте логин и/или пароль ещё раз",
////            toastLength: Toast.LENGTH_SHORT,
////            gravity: ToastGravity.CENTER,
////            timeInSecForIosWeb: 1,
////            backgroundColor: Colors.red,
////            textColor: Colors.black,
////            fontSize: 16.0);
////      } else {
////        _emailController.clear();
////        _passwordController.clear();
////      }
////    }
////
////    void _registerButtonAction() async {
////      _email = _emailController.text;
////      _password = _passwordController.text;
////
////      if (_email.isEmpty || _password.isEmpty) return;
////
////      User user = await _authService.registerWithEmailAndPassword(
////          _email.trim(), _password.trim());
////      if (user == null) {
////        Fluttertoast.showToast(
////            msg:
////                "Вы не можете зарегестрироваться! Пожалуйста, проверьте логин и/или пароль ещё раз",
////            toastLength: Toast.LENGTH_SHORT,
////            gravity: ToastGravity.CENTER,
////            timeInSecForIosWeb: 1,
////            backgroundColor: Colors.red,
////            textColor: Colors.black,
////            fontSize: 16.0);
////      } else {
////        _emailController.clear();
////        _passwordController.clear();
////      }
////    }
////
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          _logo(),
//          SizedBox(height: 10),
//          SizedBox(
//            width: 360,
//            child: TextFormField(
//              validator: (input) {
//                if (input.isEmpty) {
//                  return 'Please type an email';
//                }
//              },
//              decoration: InputDecoration(labelText: 'Email'),
//              controller: emailTextController,
//            ),
//          ),
//          SizedBox(
//            width: 360,
//            child: TextFormField(
//              obscureText: true,
//              validator: (input) {
//                if (input.isEmpty) {
//                  return 'Please type an password';
//                }
//              },
//              decoration: InputDecoration(labelText: 'Password'),
//              controller: passwordTextController,
//            ),
//          ),
//          SizedBox(height: 20),
//          SizedBox(
//            width: 360,
//            child: RaisedButton(
//              child: Row(
//                children: <Widget>[
//                  Icon(Icons.mail, size: 30),
//                  Text(
//                    '  Sign up with Email',
//                    style: TextStyle(fontSize: 28),
//                  ),
//                ],
//              ),
//              textColor: Colors.white,
//              color: Colors.red[400],
//              padding: EdgeInsets.all(10),
//              onPressed: () {
//                signUpWithMail();
//              },
//            ),
//          ),
//          SizedBox(height: 20),
//          SizedBox(
//            width: 360,
//            child: FacebookSignInButton(
//              onPressed: () {
//                signUpWithFacebook();
//              },
//            ),
//          ),
//          SizedBox(
//            width: 360,
//            child: GoogleSignInButton(
//              onPressed: () {
//                _googleSignUp();
//              },
//            ),
//          ),
//
////          (showLogin
////              ? Column(
////                  children: <Widget>[
////                    _form('Войти', _loginButtonAction),
////                    Padding(
////                      padding: EdgeInsets.all(10),
////                      child: GestureDetector(
////                        child: Text(
////                          'Ещё не зарегестрированы? Зарегестрироваться',
////                          style: TextStyle(fontSize: 16, color: Colorsys.pink),
////                        ),
////                        onTap: () {
////                          setState(() {
////                            showLogin = false;
////                          });
////                        },
////                      ),
////                    )
////                  ],
////                )
////              : Column(
////                  children: <Widget>[
////                    _form('Зарегестрироваться', _registerButtonAction),
////                    Padding(
////                      padding: EdgeInsets.all(10),
////                      child: GestureDetector(
////                        child: Text(
////                          'Уже зарегестрированы? Войти',
////                          style: TextStyle(fontSize: 16, color: Colorsys.pink),
////                        ),
////                        onTap: () {
////                          setState(() {
////                            showLogin = true;
////                          });
////                        },
////                      ),
////                    )
////                  ],
////                ))
//        ],
//      ),
//    );
//  }
//
//  Future<void> _googleSignUp() async {
//    try {
//      final GoogleSignIn _googleSignIn = GoogleSignIn(
//        scopes: ['email'],
//      );
//      final FirebaseAuth _auth = FirebaseAuth.instance;
//
//      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//      final GoogleSignInAuthentication googleAuth =
//          await googleUser.authentication;
//
//      final AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//
//      final FirebaseUser user =
//          (await _auth.signInWithCredential(credential)).user;
//      print("signed in " + user.displayName);
//
//      return user;
//    } catch (e) {
//      print(e.message);
//    }
//  }
//
//  Future<void> signUpWithFacebook() async {
//    try {
//      var facebookLogin = new FacebookLogin();
//      var result = await facebookLogin.logIn(['email']);
//
//      if (result.status == FacebookLoginStatus.loggedIn) {
//        final AuthCredential credential = FacebookAuthProvider.getCredential(
//          accessToken: result.accessToken.token,
//        );
//        final FirebaseUser user =
//            (await FirebaseAuth.instance.signInWithCredential(credential)).user;
//        print('signed in ' + user.displayName);
//        return user;
//      }
//    } catch (e) {
//      print(e.message);
//    }
//  }
//
//  Future<void> signUpWithMail() async {
//    try {
//      await FirebaseAuth.instance.createUserWithEmailAndPassword(
//          email: emailTextController.text,
//          password: passwordTextController.text);
//      showDialog(
//          context: context,
//          builder: (context) {
//            return AlertDialog(
//              content: Text('Success sign up'),
//            );
//          });
//    } catch (e) {
//      print(e.message);
//      showDialog(
//          context: context,
//          builder: (context) {
//            return AlertDialog(
//              content: Text(e.message),
//            );
//          });
//    }
//  }
//}
