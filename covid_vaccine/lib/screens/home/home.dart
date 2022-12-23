import 'package:covid_vaccine/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:covid_vaccine/screens/authenticate/authenticate.dart';
import 'package:covid_vaccine/models/user.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      title: "Home",
    );
  }
}

/// Home page widget
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );
  final AuthService _auth = AuthService();
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final listItem = Container(
      //width: 375,
      height: 110,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        //color: Colors.orange,
        border: Border.all(color: Colors.grey /*[800]*/, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ), // set rounded corner radius
        //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
      ),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
        child: MaterialButton(
          //color: Color(0xFFC1EAFC),//1B76C0),
          color: Colors.white,
          minWidth: MediaQuery.of(context).size.width,
          height: 20,
          //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPPage(),
              ),
            );
          },
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      right: 10.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(31.0),
                        ),
                      ),
                      child: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/profile.png'),
                        ),
                        radius: 35.0,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "John Doe",
                        //textAlign: TextAlign.start,
                        style: style.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "ID: ",
                            textAlign: TextAlign.left,
                            style: style.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Monospace',
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "e5bbb42858be",
                            textAlign: TextAlign.left,
                            style: style.copyWith(
                              color: Colors.black45,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Monospace',
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Status:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Monospace',
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    final addBtn = Container(
      //width: 365,
      height: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.orange,
        border: Border.all(color: Colors.grey /*[800]*/, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ), // set rounded corner radius
        //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
      ),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        child: MaterialButton(
          //color: Colors.cyan,
          minWidth: MediaQuery.of(context).size.width,
          //height: 70,
          //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/rqr');
            //Navigator.of(context).pushNamed('/reg');
          },
          child: Center(
            child: Container(
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
    final _buttonList = Column(
      children: List<Widget>.generate(
        10,
        (index) => Column(
          children: <Widget>[
            listItem,
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );

    List<Widget> actionButtonOptions = <Widget>[
      FloatingActionButton(
        onPressed: () {
          print("add");
        },
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        onPressed: () {
          print("arrow_upward");
        },
        child: Icon(Icons.arrow_upward),
      ),
      FloatingActionButton(
        onPressed: () {
          print("arrow_downward");
        },
        child: Icon(Icons.arrow_downward),
      ),
    ];

    final actionButton = FloatingActionButton(
      //elevation: 3.0,
      //backgroundColor: Colors.cyan[300],
      //tooltip: 'Go to top',
      child: Icon(Icons.arrow_upward_rounded),
      onPressed: () {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );

        print("options button");
      },
    );

    /// Will used to access the Animated list
    final GlobalKey<AnimatedListState> _optionsKey =
        new GlobalKey<AnimatedListState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    double prev = 0.0;
    bool optionsVisible = false;
    Widget slideIt(
      BuildContext context,
      int index,
      Animation<double> animation,
    ) {
      FloatingActionButton item = actionButtonOptions[index];
      prev = index.toDouble();

      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, optionsVisible ? 0 : -(3 - prev) * 0.4),
          end: Offset(0, optionsVisible ? -(3 - prev) * 0.4 : (-prev) * 0.4),
        ).animate(animation),
        child: item,
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '(Anonymous)',
                style: TextStyle(
                  fontFamily: 'Monospace',
                  fontSize: 25,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan[300],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () async {
                print("signing out");
                Navigator.of(context).popUntil((route) => false);
                UserData userX = await _auth.signOut();
                print("$userX signed out");
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.cyan[300],
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
            tooltip: 'Navigation menu',
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          title: Text(
            'Home', // Page',
            style: style.copyWith(
              color: Colors.grey[100],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          actions: <Widget>[
            /*IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0,
              ),
              tooltip: 'Add',
              onPressed: () {
                Navigator.of(context).pushNamed('/reg');
              },
            ),*/
            IconButton(
              icon: Icon(
                Icons.watch,
                color: Colors.white,
                size: 30.0,
              ),
              tooltip: 'Refresh',
              onPressed: () {
                //Navigator.of(context).popUntil((route) => false);
                Navigator.of(context).pushNamed('/wgt');
              },
            ),
          ],
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              width: 600,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    _buttonList,
                    addBtn,
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 58,
            child: AnimatedList(
              key: _optionsKey,
              shrinkWrap: true,
              itemBuilder: (context, index, animation) {
                return slideIt(context, index, animation);
              },
            ),
          ),
          FloatingActionButton(
            //elevation: 3.0,
            backgroundColor: Colors.cyan[300],
            //tooltip: 'Go to top',
            child: Icon(Icons.arrow_upward_rounded),
            onPressed: () {
              /*_scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
              );*/
              if (!optionsVisible) {
                int count = actionButtonOptions.length;
                while (0 < count--) {
                  _optionsKey.currentState.insertItem(
                    0,
                    duration: Duration(milliseconds: 100 * (3 - count)),
                  );
                }
                optionsVisible = true;
              } else {
                int count = actionButtonOptions.length;
                while (0 < count--) {
                  _optionsKey.currentState.removeItem(
                    count,
                    (_, animation) => slideIt(context, 0, animation),
                    duration: Duration(milliseconds: 100 * count * count),
                  );
                }
                optionsVisible = false;
              }
              print("options button");
            },
          ),
        ],
      ),
    );
  }

  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed:
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/
}
