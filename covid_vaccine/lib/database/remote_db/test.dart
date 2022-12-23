import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class GetFromWeb extends StatefulWidget {
  const GetFromWeb({Key key}) : super(key: key);

  @override
  _GetFromWebState createState() => _GetFromWebState();
}

class _GetFromWebState extends State<GetFromWeb> {
  // Future<void> getData() async {
  //   Response response = await get(
  //     'http://worldclockapi.com/api/json/est/now',
  //   );
  //   //'http://192.168.1.6:4000/api/ninjas?lng=-80.1&lat=25.8'
  //   /*List result = jsonDecode(response.body);
  //   result.forEach((element) {
  //     print(element['name']);
  //   });*/
  //   print(jsonDecode(response.body));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.http),
          iconSize: 40.0,
        ),
      ),
    );
  }
}
