import 'package:cartrack/common/tabBarView.dart';
import 'package:cartrack/common/tabBarView.dart';
import 'package:cartrack/screens/carMap.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: new AppBar(
            backgroundColor: Colors.black,
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  transform: Matrix4.translationValues(-12.0, 0.0, 0.0),
                  child: new IconButton(
                      iconSize: 30,
                      icon: new Icon(Icons.menu),
                      color: Colors.yellow[600],
                      onPressed: () => _scaffoldKey.currentState.openDrawer()),
                ),
                Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.yellow[600]),
                ),
                Spacer(),
                IconButton(
                  iconSize: 25,
                  icon: new Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () => {},
                  //  onPressed: () {
                  //                 Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(builder: (context) => TabBarView()),
                  //                 );
                  // },
                ),

                // new Row(
                //   children: <Widget>[
                //     Padding(
                //     padding: const EdgeInsets.all(3),
                //     child: new Image.asset(
                //       'assets/images/share.png',
                //       fit: BoxFit.cover,
                //       height: 30,
                //     ),),
                //     Padding(
                //     padding: const EdgeInsets.all(3),
                //     child:new Image.asset(
                //       'assets/images/instagram.png',
                //       fit: BoxFit.cover,
                //       height: 30,
                //     ),),
                //     Padding(
                //     padding: const EdgeInsets.all(3),
                //     child:new Image.asset(
                //       'assets/images/twitter.png',
                //       fit: BoxFit.cover,
                //       height: 30,
                //     ),),
                //     Padding(
                //     padding: const EdgeInsets.all(3),
                //     child: new Image.asset(
                //       'assets/images/facebook.png',
                //       fit: BoxFit.cover,
                //       height: 30,
                //     ),),
                //   ]
                // ),
              ],
            ),
          ),
        ),
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.grey[800],
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 190,
                      height: 42,
                      child: FlatButton(
                        color: Colors.black,
                        onPressed: () {},
                        child: Text(
                          "LIST VIEW",
                          style: TextStyle(color: Colors.yellow[600]),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      height: 42,
                      child: FlatButton(
                        color: Colors.grey[800],
                        onPressed: () {},
                        child: Text(
                          "MAP VIEW",
                          style: TextStyle(color: Colors.yellow[600]),
                        ),
                      ),
                    ),

                    // Container(
                    //    width: MediaQuery.of(context).size.width/2-10,
                    //     // height: 40,
                    //     color: Colors.black,
                    //   child: Center(child: Text("LIST VIEW",style: TextStyle(color: Colors.yellow[600]),)),
                    // ),
                    //  Container(
                    //      width: MediaQuery.of(context).size.width/2-10,
                    //     // height: 40,
                    //       color: Colors.black,
                    //   child: Center(child: Text("MAP VIEW",style: TextStyle(color: Colors.yellow[600]),)),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                    //  height: 40,
                    padding: const EdgeInsets.all(8.0),
                      color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          Text("Running"),
                          Text("3"),
                        ],
                      ),
                    ),
                    Container(
                      // height: 40,
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Text("Stopped"),
                          Text("3"),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Column(
                        children: <Widget>[
                          Text("Idle"),
                          Text("3"),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.blue[900],
                      child: Column(
                        children: <Widget>[
                          Text("Inactive"),
                          Text("3"),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey,
                      child: Column(
                        children: <Widget>[
                          Text("Expired"),
                          Text("3"),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Text("Total"),
                          Text("3"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Container(
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      buildContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      

                   
          
                

                
        ])),
      ),
         
          
        
            ]
          )
        ]
      )
      )   
    );
    
  }

  Widget buildContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("UP 53 DT 9621"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gorakhpur (UP), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            //  Row(children: <Widget>[
            //    Text("Gorakhpur Bypass, UP 273016, India")
            //  ],)
          ],
        ),
      ),
    );
  }
}
