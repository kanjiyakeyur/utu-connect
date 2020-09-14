import 'package:flutter/material.dart';
import './drawer_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
class StudentLoginScreen extends StatelessWidget {
  static const routeName = '/studentLogin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title : 
            Center(
              child: Text('Student Login ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.indigo.shade700,
                ),
              ),
            ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.insert_link), onPressed: null)
        ],
      ),
      drawer: DrawerScreen(routeName),
      body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://app.utu.ac.in/stud/',
          ),
    );
  }
}