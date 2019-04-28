import 'package:flutter/material.dart';
import "./pages/outpass_page.dart";
import "./pages/leave_page.dart";
import './pages/complaint_page.dart';
import './product_fab.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  bool isOpened = false;
  TabController tabController;
  

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Student Portal'),
        bottom: new TabBar(controller: tabController,tabs: <Widget>[
          new Tab(
            icon: new Icon(Icons.playlist_add),
            text: "Outpass",
          ),
          new Tab(
            icon: new Icon(Icons.arrow_forward,),
            text: "Leave",
          ),
          new Tab(
            icon: new Icon(Icons.announcement,),
            text: "Complaints",
          )
        ],
        ),

      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: new Text("Aman Singhal",style: new TextStyle(fontSize: 20.0),), accountEmail: new Text("aman0550singhal@gmail.com",),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("assets/profile.jpg"),
              ),
            ),
            new ListTile(
              title: new Text("Edit Profile",style: new TextStyle(fontSize: 17.0),),
              trailing: new Icon(Icons.create),
              onTap: (){},

            ),
            new ListTile(
              title: new Text("Setting",style: new TextStyle(fontSize: 17.0)),
              trailing: new Icon(Icons.settings),
              onTap: (){},

            ),
            new Divider(),
            new ListTile(
              title: new Text("Help",style: new TextStyle(fontSize: 17.0)),
              trailing: new Icon(Icons.help),
              onTap: (){},

            ),
            new ListTile(
              title: new Text("Send Feedback",style: new TextStyle(fontSize: 17.0)),
              trailing: new Icon(Icons.feedback),
              onTap: (){},

            ),
            new ListTile(
              title: new Text("About",style: new TextStyle(fontSize: 17.0)),
              trailing: new Icon(Icons.info),
              onTap: (){},

            ),
            new ListTile(
              title: new Text("Log Out",style: new TextStyle(fontSize: 17.0)),
              trailing: new Icon(Icons.exit_to_app),
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.of(context).pushReplacementNamed('/landingpage');
                }).catchError((e){print(e);});
              },

            ),


          ],
        ),
      ),

      body:new Stack( children: <Widget>[new TabBarView(children: <Widget>[
        new OutpassPage(),new LeavePage(),new ComplainPage()
      ],
        controller: tabController,
      ),
      ],
      ),
      // bottomNavigationBar: BottomAppBar(child: new Container(height: 60.0,color: Colors.blue,),notchMargin: 2.0,shape: CircularNotchedRectangle(),),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: ProductFAB(),
    );
  }

}

