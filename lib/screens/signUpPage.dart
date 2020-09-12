import 'dart:convert';
import 'dart:io';
// import 'dart:wasm';
// import 'package:bolopik/POJO/LoginResponse.dart';
// import 'package:bolopik/POJO/UserResponse.dart';
// import 'package:bolopik/screens/homeScreen.dart';
// import 'package:bolopik/screens/mainScreen.dart';
// import 'package:bolopik/screens/signInPage.dart';
// import 'package:dio/dio.dart';
import 'package:cartrack/screens/homeScreen.dart';
import 'package:cartrack/screens/truck_details.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supplyvalid/screens/truck_details.dart';
// import '../POJO/RegisterResponse.dart';

// import 'mainScreen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name, email, password, password_confirmation;

  RegExp regex = new RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp regex1 = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp regex2 = new RegExp(r'^([a-zA-Z])[a-zA-Z_-]*[\w_-]*[\S]$|^([a-zA-Z])[0-9_-]*[\S]$|^[a-zA-Z]*[\S]$');
  bool isVisible;
  Icon visibleIcon;

  bool isLoading;
  // final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
  @override
  String initState() {
    name = "";
    email = "";
    password = "";
    password_confirmation = "";

    isLoading = false;
    isVisible = true;
    visibleIcon =
        isVisible == true ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
  }

  // static var uri = "https://bolopik.com/";

  // static BaseOptions options = BaseOptions(
  //     baseUrl: uri,
  //     responseType: ResponseType.plain,
  //     connectTimeout: 30000,
  //     receiveTimeout: 30000,
  //     validateStatus: (code) {
  //       if (code >= 200) {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     });

  // static Dio dio = Dio(options);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        // appBar: AppBar(
        //   actions: <Widget>[
        //     Container(
        //          decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //         Colors.indigo,
        //         Colors.deepOrange,
        //       ]),
        //       // image: DecorationImage(
        //       //   image: AssetImage("assets/images/background.png"),
        //       //   fit: BoxFit.cover,
        //       // ),
        //     ),

        //     )
        //   ],
        // ),
        // return new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: Stack(children: <Widget>[
         
          new Container(
            
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                Colors.indigo,
                Colors.deepOrange,
              ]),
              // image: DecorationImage(
              //   image: AssetImage("assets/images/background.png"),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          new Center(
            child: new SingleChildScrollView(
              child: new Container(
                height: 400,
                margin: const EdgeInsets.only(top: 0, bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Form(
                    // key: _formKey,
                    autovalidate: isLoading,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                         Container(
                           height: 60,
                           width: 250,
                           decoration: BoxDecoration(
                             gradient: LinearGradient(colors: [
                               Colors.purple,
                               Colors.deepPurpleAccent,
                             ]
                             ),
                             borderRadius: BorderRadius.circular(15),
                           ),
                          child: Center(child: Text("Road Point", style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),)),
                        ),
                           Container(
                           height: 60,
                           width: 250,
                          child: Center(child: Text("Login", style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),)),
                        ),

                        // SizedBox(
                        //   height: 160,
                        //   child: Container(
                        //     height: 200.0,
                        //     width: 230.0,
                        //     // margin: const EdgeInsets.only(bottom: 0),
                        //     child: new Image(
                        //         image: AssetImage("assets/Logo.png"),
                        //         fit: BoxFit.contain),
                        //   ),
                        // ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       vertical: 2.0, horizontal: 5.0),
                              //   child: TextField(
                              //     keyboardType: TextInputType.text,
                              //     decoration: InputDecoration(
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       prefixIcon: Icon(Icons.chevron_right),
                              //       hintText: 'User ID',
                              //       enabledBorder: OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.white),
                              //           borderRadius: BorderRadius.all(
                              //               Radius.circular(30))),
                              //       border: OutlineInputBorder(
                              //         borderSide:
                              //             BorderSide(color: Colors.white),
                              //         borderRadius:
                              //             BorderRadius.all(Radius.circular(30)),
                              //       ),
                              //     ),
                                  
                              //     onChanged: (input) {
                              //       setState(() {
                              //         name = input;
                              //       });
                              //     },
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5.0),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.chevron_right),
                                    hintText: 'User ID',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                               
                                  onChanged: (input) {
                                    setState(() {
                                      email = input;
                                    });
                                  },
                                ),
                              ),
                                SizedBox(
                          height: 15.0,
                        ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5.0),
                                child: TextField(
                                  // keyboardType: TextInputType.visiblePassword,
                                  // obscureText: isVisible,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: Icon(Icons.chevron_right),
                                      hintText: 'Password',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      // suffixIcon: IconButton(
                                      //   icon: visibleIcon,
                                      //   onPressed: () {
                                      //     setState(() {
                                      //       isVisible = !isVisible;
                                      //       visibleIcon = isVisible == true
                                      //           ? Icon(Icons.visibility)
                                      //           : Icon(Icons.visibility_off);
                                      //     });
                                      //   },
                                      // )
                                      ),
                                  
                                  onChanged: (input) {
                                    setState(() {
                                      password = input;
                                    });
                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       vertical: 2.0, horizontal: 5.0),
                              //   child: TextField(
                              //     // obscureText: isVisible,
                              //     decoration: InputDecoration(
                              //         filled: true,
                              //         fillColor: Colors.white,
                              //         prefixIcon: Icon(Icons.chevron_right),
                              //         hintText: 'Product Type',
                              //         enabledBorder: OutlineInputBorder(
                              //             borderSide:
                              //                 BorderSide(color: Colors.white),
                              //             borderRadius: BorderRadius.all(
                              //                 Radius.circular(30))),
                              //         border: OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.white),
                              //           borderRadius: BorderRadius.all(
                              //               Radius.circular(30)),
                              //         ),
                              //         // suffixIcon: IconButton(
                              //         //   icon: visibleIcon,
                              //         //   onPressed: () {
                              //         //     setState(() {
                              //         //       isVisible = !isVisible;
                              //         //       visibleIcon = isVisible == true
                              //         //           ? Icon(Icons.visibility)
                              //         //           : Icon(Icons.visibility_off);
                              //         //     });
                              //         //   },
                              //         // )
                              //         ),
                              //     // validator: validateConfirmPassword,
                              //     onChanged: (input) {
                              //       setState(() {
                              //         password_confirmation = input;
                              //       });
                              //     },
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55.0,
                        ),
                        // !isLoading
                        //     ?
                             Container(
                                transform:
                                    Matrix4.translationValues(0.0, -10.0, 0.0),
                                margin: const EdgeInsets.all(5),
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () async {
                                    // register user details in database

                                    // if (name.isEmpty) {
                                    //   showInDialog(
                                    //       context, "Error", "User ID is Empty!");
                                    // } 
                                    //  else if (!regex2.hasMatch(name)) {
                                    //   showInDialog(context, "Error",
                                    //       "Please enter name in this format :username | user123 |user_123 | user-123 | username123_type"); 
                                    //       }
                                          // else 
                                    //       if (name.length < 2) {
                                    //   showInDialog(context, "Error",
                                    //       "Name is too short");
                                    // }else
                                     if (email.isEmpty) {
                                      showInDialog(
                                          context, "Error", "User ID is Empty!");
                                    }
                                    //  else if (!regex1.hasMatch(email)) {
                                    //   showInDialog(context, "Error",
                                    //       "Please enter a valid email");
                                    // } 
                                    else if (password.isEmpty) {
                                      showInDialog(context, "Error",
                                          "Password is Empty!");
                                    } 
                                      else if (password=="demo" && email=="demo") {
                                       Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomeScreen()),
                                                      );
                                    } 
                                     else if (password!="demo" || email!="demo") {
                                      showInDialog(context, "Error",
                                          "Please correct user id or password !");
                                    } 
                                    // else if (password.length < 6) {
                                    //   showInDialog(context, "Error",
                                    //       "The password must be at least 6 characters.");
                                    // }
                                    //  else if (!regex.hasMatch(password)) {
                                    //   showInDialog(context, "Error",
                                    //       "Please enter a valid password: Minimum 1 Upper case, 1 lowercase,1 Numeric Number,Special Character, 1 Special Character");
                                    // }
                                    // else if (password_confirmation.isEmpty) {
                                    //   showInDialog(context, "Error",
                                    //       "Product type is Empty!");
                                    // }
                                    //  else if (password_confirmation !=
                                    //     password) {
                                    //   showInDialog(context, "Error",
                                    //       "Password & Confirm Password not matching!");
                                    // }
                                    // else {
                                    //    if (_formKey.currentState.validate()) {

                                    //     _formKey.currentState.save();
                                    //   }
                                    else 
                                    {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      // _validateInputs();

                                      // var res = await _registerUser(name, email,
                                      //     password, password_confirmation);
                                      // RegisterResponse registerResponse =
                                      //     RegisterResponse.fromJson(res);

                                      // if (registerResponse.success == true) {
                                      //   var res =
                                      //       await _loginUser(email, password);

                                      //   LoginResponse loginResponse =
                                      //       LoginResponse.fromJson(res);

                                      //   if (loginResponse.access_token !=
                                      //       null) {
                                      //     var userRes = await getUserDetails(
                                      //         loginResponse.access_token);
                                      //     UserResponse userResponse =
                                      //         UserResponse.fromJson(userRes);

                                      //     if (userResponse.success == true) {
                                      //       setState(() {
                                      //         isLoading = false;
                                      //       });

                                      //       showDialog(
                                      //         context: context,
                                      //         child: new AlertDialog(
                                      //           title: Text("Success"),
                                      //           content: Text(
                                      //               "User Registered Successfully."),
                                      //           actions: [
                                      //             new FlatButton(
                                      //               child: const Text("Ok"),
                                      //               onPressed: () async {
                                      //                 SharedPreferences
                                      //                     sharedPreferences =
                                      //                     await SharedPreferences
                                      //                         .getInstance();
                                      //                 sharedPreferences
                                      //                     .setString(
                                      //                         "access_token",
                                      //                         loginResponse
                                      //                             .access_token);
                                      //                 sharedPreferences
                                      //                     .setString(
                                      //                         "name",
                                      //                         userResponse
                                      //                             .data.name);
                                      //                 sharedPreferences
                                      //                     .setString(
                                      //                         "email",
                                      //                         userResponse
                                      //                             .data.email);
                                      //                 sharedPreferences
                                      //                     .setString(
                                      //                         "ranking",
                                      //                         userResponse.data
                                      //                             .ranking);
                                      //                 sharedPreferences
                                      //                     .setString(
                                      //                         "points",
                                      //                         userResponse
                                      //                             .data.points);
                                      //                 sharedPreferences
                                      //                     .setString(
                                      //                         "origin",
                                      //                         userResponse
                                      //                             .data.origin);

                                      //                 Navigator.pop(context);
                                                      // Navigator.push(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //       builder: (context) =>
                                                      //           TruckDetails()),
                                                      // );
                                      //               },
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       );
                                      //     }
                                      //      else {
                                      //       setState(() {
                                      //         isLoading = false;
                                      //       });
                                      //     }
                                      //   } else {
                                      //     setState(() {
                                      //       isLoading = false;
                                      //     });
                                      //     showInDialog(
                                      //         context, "Error", "Login Error");
                                      //   }
                                      // } 
                                      // else {
                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      //   showInDialog(context, "Error",
                                      //       registerResponse.message);
                                      // }
                                    }
                                  },
                                  color: Color(0xff2E3192),
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Open Sans',
                                    ),
                                  ),
                                ),
                              ),
                            // : Container(
                            //     transform:
                            //         Matrix4.translationValues(0.0, -10.0, 0.0),
                            //     margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                            //     height: 40,
                            //     child: Center(
                            //       child: CircularProgressIndicator(),
                            //     ),
                            //   ),
                       
                        // Container(
                        //   transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                        //   margin: const EdgeInsets.all(5),
                        //   color: Colors.transparent,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 40,
                        //   child: FlatButton(
                        //     shape: new RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(30.0),
                        //     ),
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => TruckDetails()),
                        //       );
                        //     },
                        //     color: Color(0xff22B300),
                        //     child: Text(
                        //       "Back to Sign in",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 16,
                        //         fontFamily: 'Open Sans',
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      
                        // Container(
                        //   transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                        //   margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        //   color: Colors.transparent,
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 40,
                        //   child: FlatButton(
                        //     shape: new RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(30.0),
                        //     ),
                        //     onPressed: () {
                        //       // Navigator.push(
                        //       //   context,
                        //       //   MaterialPageRoute(
                        //       //       builder: (context) => HomeScreen()),
                        //       // );
                        //     },
                        //     color: Color(0xff003869),
                        //     child: Text(
                        //       "Back to Home",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 16,
                        //         fontFamily: 'Open Sans',
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      )
    );
  }

  // Future<dynamic> _registerUser(String name, String email, String password,
  //     String password_confirmation) async {
  //   try {
  //     Options options = Options(
  //       contentType: ContentType.parse('application/json'),
  //     );

  //     var response = await dio.post('api/emailRegister',
  //         data: {
  //           "name": name,
  //           "email": email,
  //           "password": password,
  //           "password_confirmation": password_confirmation
  //         },
  //         options: options);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var responseJson = json.decode(response.data);
  //       return responseJson;
  //     } else
  //       setState(() {
  //         isLoading = false;
  //       });
  //     showInDialog(context, "Error", 'Registration Error');
  //   } on DioError catch (exception) {
  //     if (exception == null ||
  //         exception.toString().contains('SocketException')) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       showInDialog(context, "Error", "Network Error");
  //     } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
  //         exception.type == DioErrorType.CONNECT_TIMEOUT) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       showInDialog(context, "Error",
  //           "Could'nt connect, please ensure you have a stable network.");
  //     } else {
  //       return null;
  //     }
  //   }
  // }

  // Future<dynamic> _loginUser(String username, String password) async {
  //   try {
  //     Options options = Options(
  //       contentType: ContentType.parse('application/json'),
  //     );

  //     var response = await dio.post('oauth/token',
  //         data: {
  //           "username": username,
  //           "password": password,
  //           "grant_type": "password",
  //           "client_id": "2",
  //           "client_secret": "LBOzUfen0hmQjDSSHrxzaT7KeyniHkxIcpP7Gc8M"
  //         },
  //         options: options);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var responseJson = json.decode(response.data);
  //       return responseJson;
  //     } else
  //       setState(() {
  //         isLoading = false;
  //       });
  //     showInDialog(context, "Error", "Incorrect Email/Password");
  //   } on DioError catch (exception) {
  //     if (exception == null ||
  //         exception.toString().contains('SocketException')) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       showInDialog(context, "Error", "Network Error");
  //     } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
  //         exception.type == DioErrorType.CONNECT_TIMEOUT) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       showInDialog(context, "Error",
  //           "Could'nt connect, please ensure you have a stable network.");
  //     } else {
  //       return null;
  //     }
  //   }
  // }

  // Future<dynamic> getUserDetails(String access_token) async {
  //   try {
  //     Options options = Options(
  //       contentType: ContentType.parse('application/json'),
  //       headers: {HttpHeaders.authorizationHeader: "Bearer " + access_token},
  //     );

  //     var response = await dio.get('api/v1/user', options: options);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var responseJson = json.decode(response.data);
  //       return responseJson;
  //     } else
  //       setState(() {
  //         isLoading = false;
  //       });
  //     print("Error: " + "Incorrect Email/Password");
  //   } on DioError catch (exception) {
  //     if (exception == null ||
  //         exception.toString().contains('SocketException')) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       print("Error: " + "Network Error");
  //     } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
  //         exception.type == DioErrorType.CONNECT_TIMEOUT) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       print("Error: " +
  //           "Could'nt connect, please ensure you have a stable network.");
  //     } else {
  //       return null;
  //     }
  //   }
  // }

  void showInDialog(BuildContext context, String title, String value) async {
    showDialog(
      context: context,
      child: new AlertDialog(
        title: Text(title),
        content: Text(value),
        actions: [
          new FlatButton(
            child: const Text("Ok"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}