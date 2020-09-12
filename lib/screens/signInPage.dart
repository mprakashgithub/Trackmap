// import 'dart:io';

// import 'package:bolopik/POJO/LoginResponse.dart';
// import 'package:bolopik/POJO/UserResponse.dart';
// import 'package:bolopik/screens/forgotPassword.dart';
// import 'package:bolopik/screens/homeScreen.dart';
// import 'package:bolopik/screens/mainScreen.dart';
// import 'package:bolopik/screens/signUpPage.dart';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignInPageScreen extends StatefulWidget {
//   SignInPageScreen({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _SignInPageScreenState createState() => _SignInPageScreenState();
// }

// class _SignInPageScreenState extends State<SignInPageScreen> {
//   TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   String email, password;

//   bool isVisible;
//   Icon visibleIcon;

//   bool rememberMe;

//   bool isLoading;

//   RegExp regex = new RegExp(
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//   RegExp regex1 = new RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//   RegExp regex2 = new RegExp(
//       r'^([a-zA-Z])[a-zA-Z_-]*[\w_-]*[\S]$|^([a-zA-Z])[0-9_-]*[\S]$|^[a-zA-Z]*[\S]$');

//   getDataFromSharedPrefs() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       bool remember_me = sharedPreferences.getBool("rememberMe") ?? false;
//       if (remember_me) {
//         password = sharedPreferences.getString("password");
//         email = sharedPreferences.getString("email");
//         rememberMe = true;
//       } else {
//         email = "";
//         password = "";
//         rememberMe = false;
//       }
//     });
//   }

//   @override
//   void initState() {
//     isLoading = false;

//     getDataFromSharedPrefs();

//     isVisible = true;
//     visibleIcon =
//         isVisible == true ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
//   }

//   static var uri = "https://bolopik.com/";

//   static BaseOptions options = BaseOptions(
//       baseUrl: uri,
//       responseType: ResponseType.plain,
//       connectTimeout: 30000,
//       receiveTimeout: 30000,
//       validateStatus: (code) {
//         if (code >= 200) {
//           return true;
//         } else {
//           return false;
//         }
//       });

//   static Dio dio = Dio(options);

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//         backgroundColor: Colors.transparent,
//         key: _scaffoldKey,
//         body: Stack(
//           children: <Widget>[
//             new Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/background.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             new Center(
//               child: new SingleChildScrollView(
//                 child: new Container(
//                   margin: const EdgeInsets.only(top: 0, bottom: 50),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
//                     child: Form(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: <Widget>[
//                           SizedBox(
//                             height: 200,
//                             child: Container(
//                               height: 230.0,
//                               width: 230.0,
//                               margin: const EdgeInsets.only(bottom: 20),
//                               child: new Image(
//                                   image: AssetImage("assets/images/Logo.png"),
//                                   fit: BoxFit.contain),
//                             ),
//                           ),
//                           Container(
//                             child: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 5.0, horizontal: 10.0),
//                                   child: TextFormField(
//                                     initialValue:
//                                         rememberMe == true ? email : "",
//                                     decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                       prefixIcon: Icon(Icons.person),
//                                       hintText: 'Email',
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30))),
//                                       border: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(30)),
//                                       ),
//                                     ),
//                                     onChanged: (input) {
//                                       setState(() {
//                                         email = input;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 5.0, horizontal: 10.0),
//                                   child: TextFormField(
//                                     initialValue:
//                                         rememberMe == true ? password : "",
//                                     obscureText: isVisible,
//                                     decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         prefixIcon: Icon(Icons.lock),
//                                         hintText: 'Password',
//                                         enabledBorder: OutlineInputBorder(
//                                             borderSide:
//                                                 BorderSide(color: Colors.white),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(30))),
//                                         border: OutlineInputBorder(
//                                             borderSide:
//                                                 BorderSide(color: Colors.white),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(30))),
//                                         suffixIcon: IconButton(
//                                           icon: visibleIcon,
//                                           onPressed: () {
//                                             setState(() {
//                                               isVisible = !isVisible;
//                                               visibleIcon = isVisible == true
//                                                   ? Icon(Icons.visibility)
//                                                   : Icon(Icons.visibility_off);
//                                             });
//                                           },
//                                         )),
//                                     onChanged: (input) {
//                                       setState(() {
//                                         password = input;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(bottom: 10),
//                             child: CheckboxListTile(
//                               onChanged: _onRememberMeChanged,
//                               value: rememberMe,
//                               controlAffinity: ListTileControlAffinity
//                                   .leading, //  <-- leading Checkbox
//                               title: Text("Keep me signed in"),
//                             ),
//                           ),
//                           !isLoading
//                               ? Container(
//                                   transform: Matrix4.translationValues(
//                                       0.0, -10.0, 0.0),
//                                   margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
//                                   color: Colors.transparent,
//                                   width: MediaQuery.of(context).size.width,
//                                   height: 40,
//                                   child: FlatButton(
//                                     color: Color(0xff22B300),
//                                     child: Text(
//                                       "Sign in",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontFamily: 'Open Sans',
//                                       ),
//                                     ),
//                                     shape: new RoundedRectangleBorder(
//                                       borderRadius:
//                                           new BorderRadius.circular(30.0),
//                                     ),
//                                     onPressed: () async {
//                                       // verify details with database using API

//                                       if (email.isEmpty) {
//                                         showInDialog(context, "Error",
//                                             "Email is Empty!");
//                                       } else if (!regex1.hasMatch(email)) {
//                                         showInDialog(context, "Error",
//                                             "Please enter a valid email");
//                                       } else if (password.isEmpty) {
//                                         showInDialog(context, "Error",
//                                             "Password is Empty!");
//                                       } 
//                                       else {
//                                         setState(() {
//                                           isLoading = true;
//                                         });

//                                         var res =
//                                             await _loginUser(email, password);

//                                         LoginResponse loginResponse =
//                                             LoginResponse.fromJson(res);

//                                         if (loginResponse.access_token !=
//                                             null) {
//                                           var userRes = await getUserDetails(
//                                               loginResponse.access_token);
//                                           UserResponse userResponse =
//                                               UserResponse.fromJson(userRes);

//                                           if (userResponse.success == true) {
//                                             SharedPreferences
//                                                 sharedPreferences =
//                                                 await SharedPreferences
//                                                     .getInstance();
//                                             sharedPreferences.setString(
//                                                 "access_token",
//                                                 loginResponse.access_token);
//                                             sharedPreferences.setString(
//                                                 "name", userResponse.data.name);
//                                             sharedPreferences.setString("email",
//                                                 userResponse.data.email);
//                                             sharedPreferences.setString(
//                                                 "ranking",
//                                                 userResponse.data.ranking);
//                                             sharedPreferences.setString(
//                                                 "points",
//                                                 userResponse.data.points);
//                                             sharedPreferences.setString(
//                                                 "origin",
//                                                 userResponse.data.origin);
//                                             sharedPreferences.setString(
//                                                 "password", password);
//                                             sharedPreferences.setBool(
//                                                 "rememberMe", rememberMe);
//                                             sharedPreferences.setBool(
//                                                 "isSigned", true);

//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       MainScreen()),
//                                             );
//                                           } else {
//                                             setState(() {
//                                               isLoading = false;
//                                             });
//                                           }
//                                         } else {
//                                           setState(() {
//                                             isLoading = false;
//                                           });
//                                           showInDialog(
//                                               context, "Error", "Login Error");
//                                         }
//                                       }
//                                     },
//                                   ),
//                                 )
//                               : Container(
//                                   transform: Matrix4.translationValues(
//                                       0.0, -10.0, 0.0),
//                                   margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
//                                   height: 40,
//                                   child: Center(
//                                     child: CircularProgressIndicator(),
//                                   ),
//                                 ),
//                           Container(
//                             transform:
//                                 Matrix4.translationValues(0.0, -10.0, 0.0),
//                             margin: const EdgeInsets.all(5),
//                             color: Colors.transparent,
//                             width: MediaQuery.of(context).size.width,
//                             height: 40,
//                             child: FlatButton(
//                               shape: new RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(30.0),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SignPageScreen()),
//                                 );
//                               },
//                               color: Color(0xff2E3192),
//                               child: Text(
//                                 "Register",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontFamily: 'Open Sans',
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             transform:
//                                 Matrix4.translationValues(0.0, -10.0, 0.0),
//                             margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
//                             color: Colors.transparent,
//                             width: MediaQuery.of(context).size.width,
//                             height: 40,
//                             child: FlatButton(
//                               shape: new RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(30.0),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomeScreen()),
//                                 );
//                               },
//                               color: Color(0xff003869),
//                               child: Text(
//                                 "Back to Home",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontFamily: 'Open Sans',
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             transform:
//                                 Matrix4.translationValues(0.0, -10.0, 0.0),
//                             margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
//                             color: Colors.transparent,
//                             width: MediaQuery.of(context).size.width,
//                             height: 26,
//                             child: FlatButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ForgotPassword()),
//                                 );
//                               },
//                               child: Text(
//                                 "Forgot Password?",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontFamily: 'Open Sans',
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<dynamic> _loginUser(String username, String password) async {
//     try {
//       Options options = Options(
//         contentType: ContentType.parse('application/json'),
//       );

//       var response = await dio.post('oauth/token',
//           data: {
//             "username": username,
//             "password": password,
//             "grant_type": "password",
//             "client_id": "2",
//             "client_secret": "LBOzUfen0hmQjDSSHrxzaT7KeyniHkxIcpP7Gc8M"
//           },
//           options: options);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseJson = json.decode(response.data);
//         return responseJson;
//       } else
//         setState(() {
//           isLoading = false;
//         });
//       showInDialog(context, "Error", "Incorrect Email/Password");
//     } on DioError catch (exception) {
//       if (exception == null ||
//           exception.toString().contains('SocketException')) {
//         setState(() {
//           isLoading = false;
//         });
//         showInDialog(context, "Error", "Network Error");
//       } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
//           exception.type == DioErrorType.CONNECT_TIMEOUT) {
//         setState(() {
//           isLoading = false;
//         });
//         showInDialog(context, "Error",
//             "Could'nt connect, please ensure you have a stable network.");
//       } else {
//         return null;
//       }
//     }
//   }

//   Future<dynamic> getUserDetails(String access_token) async {
//     try {
//       Options options = Options(
//         contentType: ContentType.parse('application/json'),
//         headers: {HttpHeaders.authorizationHeader: "Bearer " + access_token},
//       );

//       var response = await dio.get('api/v1/user', options: options);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseJson = json.decode(response.data);
//         return responseJson;
//       } else
//         print("Error: " + response.statusCode.toString());
//     } on DioError catch (exception) {
//       if (exception == null ||
//           exception.toString().contains('SocketException')) {
//         print("Error: " + "Network Error");
//       } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
//           exception.type == DioErrorType.CONNECT_TIMEOUT) {
//         print("Error: " +
//             "Could'nt connect, please ensure you have a stable network.");
//       } else {
//         return null;
//       }
//     }
//   }

//   void showInDialog(BuildContext context, String title, String value) async {
//     showDialog(
//       context: context,
//       child: new AlertDialog(
//         title: Text(title),
//         content: Text(value),
//         actions: [
//           new FlatButton(
//             child: const Text("Ok"),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onRememberMeChanged(bool newValue) => setState(() {
//         rememberMe = newValue;

//         if (rememberMe) {
//           // TODO: Save the user
//         } else {
//           // TODO: Forget the user
//         }
//       });
// }
