import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {  
  MainScreen({Key key, this.title}) : super(key: key); 
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);  
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp( 
      debugShowCheckedModeBanner: false,      
      home: new Scaffold(
        backgroundColor: Colors.transparent, 
        key: _scaffoldKey,
        appBar: PreferredSize(          
        preferredSize: Size.fromHeight(45.0),
        child: new AppBar(          
        backgroundColor: Colors.white,        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              new Row( 
                children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.all(3),
                  child: new Image.asset(
                    'assets/images/share.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),),
                  Padding(
                  padding: const EdgeInsets.all(3),
                  child:new Image.asset(
                    'assets/images/instagram.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),),
                  Padding(
                  padding: const EdgeInsets.all(3),
                  child:new Image.asset(
                    'assets/images/twitter.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),),
                  Padding(
                  padding: const EdgeInsets.all(3),
                  child: new Image.asset(
                    'assets/images/facebook.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),),
                ]
              ),
            ],
          ),
          leading: new IconButton(
            color:Color(0xff324492),
            iconSize: 30,
            icon: new Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),          
        ),  
        ),      
        drawer: Theme(
           data: Theme.of(context).copyWith(
                 canvasColor: Color(0xff2e3192), //This will change the drawer background to blue.
                 //other styles
              ), 
        child: new Drawer(        
        child: new ListView(
          children: <Widget> [
            new Container(      
            height: 100.0,
            child: new DrawerHeader(
              margin: const EdgeInsets.all(0),
              child:  new Container(
                width:150,
                height: 150,
                decoration: BoxDecoration( 
                  image: DecorationImage(
                    alignment: Alignment.topLeft,
                    image: AssetImage("assets/images/LogoWhite.png"), 
                    fit: BoxFit.contain,
                  ),
                ),
              ), 
              ),
            ), 
            new Divider(color: Colors.white),
            new ListTile(
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('My Profile',
                    style:TextStyle(
                      color:Colors.white,
                      fontSize:18)),
                  new Image(image: AssetImage("assets/images/user.png"),fit: BoxFit.contain), 
                ],
              ),
              onTap: () {},
            ),
            new Divider(color: Colors.white),
            new ListTile(
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('My Groups',
                    style:TextStyle(
                      color:Colors.white,
                      fontSize:18)),
                  new Image(image: AssetImage("assets/images/customer.png"),fit: BoxFit.contain), 
                ],
              ),
              onTap: () {},
            ),
            new Divider(color: Colors.white),
            new ListTile(
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Predication',
                    style:TextStyle(
                      color:Colors.white,
                      fontSize:18)),
                  new Image(image: AssetImage("assets/images/crosshair.png"),fit: BoxFit.contain), 
                ],
              ),
              onTap: () {},
            ),
            new Divider(color: Colors.white, endIndent: 10,),
            new ListTile(
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Fantasy Games',
                    style:TextStyle(
                      color:Colors.white,
                      fontSize:18)),
                  new Image(image: AssetImage("assets/images/fantacy.png"),fit: BoxFit.contain), 
                ],
              ),
              onTap: () {},
            ),
            new Divider(color: Colors.white),            
            new ListTile(
              title: new Text('Sign Out',
                style:TextStyle(
                      color:Colors.white,
                      fontSize:18)),
              onTap: () {},
            ),
          ],
        )
      ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => PredictionSoocer()),
                                // );
                              },
                          child:                         
                          Container(
                             decoration: BoxDecoration(
                              color:Color(0xff2e3192), 
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Color(0xff34438f),
                                  width: 2.0
                              )
                            ),                                                       
                            height: 150.0,
                            width: 150.0,
                            margin: const EdgeInsets.only(bottom:20),
                            child: new Image(image: AssetImage("assets/logopredictions.png"),fit: BoxFit.contain), 
                          ), ), 
                          Container(
                            decoration: BoxDecoration(
                              color:Color(0xffae2c2a),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Color(0xffae2c2a),
                                  width: 2.0
                              )
                            ),
                            
                            height: 150.0,
                            width: 150.0,
                            margin: const EdgeInsets.only(bottom:20),
                            child: new Image(image: AssetImage("assets/icon_fantasy_games.png"),fit: BoxFit.contain), 
                          ), 
                      ],
                    ),
                                      
                  ),
                ),
              ),
            ),                    
          ]
        ),                 
      ), 
    );      
  }
}