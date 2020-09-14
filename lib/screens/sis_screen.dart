import 'package:flutter/material.dart';
import './drawer_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
class SisScreen extends StatelessWidget {
  static const routeName = '/sisScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title :Center(
          child: Text('SIS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.indigo.shade700
                ),
              ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.insert_link), onPressed: null)
        ],
      ),
      drawer: DrawerScreen(routeName),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://app.utu.ac.in/EngineeringSIS/',
          )
        ,
      )
    );
  }
}