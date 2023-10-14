import 'package:asset_plus/body_page.dart';
import 'package:asset_plus/services/bloc.dart';
import 'package:asset_plus/services/networking.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    // final PageCounterBloc pageCounterBloc = Provider.of<PageCounterBloc>(context);
    // final Size size = MediaQuery.of(context).size;
    // final double categoryHeight = size.height;
    // final double categoryWidth = size.width;



    return ChangeNotifierProvider<PageCounterBloc>.value(
      value: PageCounterBloc(),
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff1F2A3B),
              leading: Icon(
                Icons.chevron_left,
                size: 40.0,
              ),
              title: RichText(
                text: TextSpan(
                    text: "MARKETING",
                    style: TextStyle(fontSize: 25.0),
                    children: [
                      TextSpan(
                          text: " COLLATERAL",
                          style: TextStyle(fontSize: 25.0, color: Colors.blue))
                    ]),
              ),
            ),
            body:BodyPage(),
          ),
        ),
      ),
    );
  }
}
