import 'package:cartrack/screens/homeScreen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
     
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

                        Container(
                          child: Column(
                            children: <Widget>[
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
                                
                                      ),
                                  
                                  onChanged: (input) {
                                    setState(() {
                                      password = input;
                                    });
                                  },
                                ),
                              ),
                         
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