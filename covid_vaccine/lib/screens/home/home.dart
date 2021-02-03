import 'package:flutter/material.dart';
import 'package:covid_vaccine/screens/authenticate/authenticate.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyHomePage(
        title: "home page",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /*void nextPage() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final nextButton = Container(
        width: 375,
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: Colors.orange,
          //color: Colors.blue,
          border: Border.all(color: Colors.grey /*[800]*/, width: 2.0),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // set rounded corner radius
          //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
        ),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          //color: Colors.blue,
          child: MaterialButton(
            //color: Colors.cyan,
            minWidth: MediaQuery.of(context).size.width,
            //height: 70,
            //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPPage()),
              );
            },
            child: Column(children: [
              Container(
                  child: Text("Adithya Suresh",
                      //textAlign: TextAlign.start,
                      style: style.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))),
              Text("ID: ",
                  //textAlign: TextAlign.left,
                  style: style.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ]),
          ),
        ));
    final addBtn = Container(
        width: 365,
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: Colors.orange,
          //color: Colors.blue,
          border: Border.all(color: Colors.grey /*[800]*/, width: 2.0),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // set rounded corner radius
          //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
        ),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          //color: Colors.blue,
          child: MaterialButton(
            //color: Colors.cyan,
            minWidth: MediaQuery.of(context).size.width,
            //height: 70,
            //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPPage()),
              );
            },
            child: Center(child:
              Container(
                  child: Text("+",
                      //textAlign: TextAlign.start,
                      style: style.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ))),
            ),
          ),
        ));
    final buttonList = Column(
      children: List<Widget>.generate(
          0,
          (index) => Column(
                children: [nextButton, SizedBox(height: 20)],
              )),
    );
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('COVID App',
            style: style.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              //fontSize: 40.0,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: Scrollbar(
        child: SingleChildScrollView(
          /*child: Padding(
            padding: const EdgeInsets.all(1.0),*/
          child: Center(
              /*width: 300,
              padding: const EdgeInsets.all(36.0),*/
              child: Column(
                  /*verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,*/
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SizedBox(
                  height: 20,
                ),
                buttonList,
                addBtn,
              ])),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),*/
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
