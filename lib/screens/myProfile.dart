import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class myProfile extends StatefulWidget {
  myProfile({
    Key key,
  }) : super(key: key);
  //final String title;this.title

  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isEditClicked;
  File _image;

  Future getImage(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // FlatButton(
                //   child: Text(
                //     "Camera",
                //     style: TextStyle(fontSize: 26),
                //   ),
                //   onPressed: () async {
                //     var image = await ImagePicker.pickImage(source: ImageSource.camera);
                //     setState(() {
                //       _image = image;
                //       Navigator.pop(context);
                //     });
                //   },
                // ),
                // FlatButton(
                //   child: Text(
                //     "Gallery",
                //     style: TextStyle(fontSize: 26),
                //   ),
                //   onPressed: () async {
                //     var image = await ImagePicker.pickImage(
                //         source: ImageSource.gallery);
                //     setState(() {
                //       _image = image;
                //       Navigator.pop(context);
                //     });
                //   },
                // ),
                _image != null
                    ? FlatButton(
                        child: Text(
                          "Remove Profile",
                          style: TextStyle(fontSize: 26),
                        ),
                        onPressed: () async {
                          setState(() {
                            _image = null;
                            Navigator.pop(context);
                          });
                        },
                      )
                    : Text(
                        "",
                      ),
              ],
            ),
          ));
        });
  }

  @override
  void initState() {
    isEditClicked = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var name;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: new AppBar(
            backgroundColor: Colors.white,
            // title: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,

            // ),
            leading: new IconButton(
                color: Color(0xff324492),
                iconSize: 30,
                icon: new Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
          ),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xff2e3192).withOpacity(0.6),
            // canvasColor: Colors.transparent,

            //This will change the drawer background to blue.
            //other styles
          ),
          child: new Drawer(
              child: new ListView(
            children: <Widget>[
              new Container(
                color: Color(0xff2e3192),
                height: 100.0,
                child: new DrawerHeader(
                  margin: const EdgeInsets.all(0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.topLeft,
                              image: AssetImage("assets/images/LogoWhite.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(name == null ? "User name" : name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ]),
                ),
              ),
              new Divider(color: Colors.transparent),
              new ListTile(
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('My Profile',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    new Image(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.contain),
                  ],
                ),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => myProfile(title: "abc",)));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myProfile()));
                },
              ),
              new Divider(color: Colors.white),
              new ListTile(
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('My Groups',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    new Image(
                        image: AssetImage("assets/images/customer.png"),
                        fit: BoxFit.contain),
                  ],
                ),
                onTap: () {},
              ),
              new Divider(color: Colors.white),
              new Container(
                padding: EdgeInsets.all(15),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('My Predication',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    new Image(
                        image: AssetImage("assets/images/crosshair.png"),
                        fit: BoxFit.contain),
                  ],
                ),
              ),

              new ListTile(
                title: Container(
                  child: new Text(' - Basketball',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionBasketball()));
                },
              ),
              new ListTile(
                title: Container(
                  child: new Text(' - Soccer',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PredictionSoocer()));
                },
              ),
              new ListTile(
                title: Container(
                  child: new Text(' - All',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                onTap: () {},
              ),
              new Divider(
                color: Colors.white,
                endIndent: 10,
              ),
              new ListTile(
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text('Fantasy Games',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    new Image(
                        image: AssetImage("assets/images/fantacy.png"),
                        fit: BoxFit.contain),
                  ],
                ),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>fantasyGamesHome()));
                },
              ),
              new Divider(color: Colors.white),
              new ListTile(
                title: new Text('Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onTap: () {
                  // SignOut();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
                },
              ),
              // new Container(
              //   color: Colors.white,
              //   padding: EdgeInsets.all(50),
              //   margin: EdgeInsets.only(top: 60),
              //   child: new Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(3),
              //         child: new Image.asset(
              //           'assets/images/share.png',
              //           fit: BoxFit.cover,
              //           height: 30,
              //         ),),
              //       Container(
              //         padding: const EdgeInsets.all(3),
              //         child:new Image.asset(
              //           'assets/images/instagram.png',
              //           fit: BoxFit.cover,
              //           height: 30,
              //         ),),
              //       Container(
              //         padding: const EdgeInsets.all(3),
              //         child:new Image.asset(
              //           'assets/images/twitter.png',
              //           fit: BoxFit.cover,
              //           height: 30,
              //         ),),
              //       Container(
              //         padding: const EdgeInsets.all(3),
              //         child: new Image.asset(
              //           'assets/images/facebook.png',
              //           fit: BoxFit.cover,
              //           height: 30,
              //         ),),
              //     ],
              //   ),
              // )
            ],
          )),
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Center(
              child: new SingleChildScrollView(
                child: new Container(
                  margin: const EdgeInsets.only(top: 0, bottom: 50),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          //BoxShape.circle,
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(43, 75, 113, 1),

                                  // borderRadius: BorderRadius.circular(60.0),
                                  border: Border.all(
                                      color: Color(0xff34438f), width: 1.0)),
                              //height: 120.0,
                              //width: 120.0,
                              margin: const EdgeInsets.only(bottom: 20),
                              child: _image == null
                                  ? Image(
                                      image: AssetImage(
                                          "assets/images/2nd_screen_user.png"),
                                      fit: BoxFit.contain)
                                  : Image(
                                      image: FileImage(_image),
                                      fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -10.0, 0.0),
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: Center(
                              child: Text(
                                "User name",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontFamily: 'open Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isEditClicked,
                            child: RaisedButton(
                              onPressed: () async {
                                //image picker
                                await getImage(context);
                              },
                              color: Colors.white,
                              child: Container(
                                width: 100,
                                child: Text(
                                  'Upload picture',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 380,
                            height: 300,
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color.fromRGBO(43, 75, 113, 1),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(16.0)),
                                Text(
                                  "Ranking",
                                  style: new TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "140",
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                                Text(
                                  "Total points",
                                  style: new TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "0",
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                                Text(
                                  "Email",
                                  style: new TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "abc@outlook.com",
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                                Text(
                                  "Member since",
                                  style: new TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "May 14, 2019",
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),

                          isEditClicked
                              ? RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEditClicked = false;
                                    });
                                  },
                                  color: Color.fromRGBO(27, 191, 2, 1),
                                  //color: Colors.white,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'Save Changes',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14.0),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                )
                              : RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEditClicked = true;
                                    });
                                  },
                                  color: Colors.white,
                                  child: Container(
                                    width: 120,
                                    child: Text(
                                      'Edit my Profile',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0),
                                      textAlign: TextAlign.justify,
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
          ],
        ),
      ),
    );
  }
}
