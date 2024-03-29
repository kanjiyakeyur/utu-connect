import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import '../provider/student.dart';
import './drawer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountInfoScreen extends StatefulWidget {
  static const routeName = '/AccountInfo';

  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  bool _showwidget = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> _showErrorDialog(String title, String errorMessage) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(title),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('Ohky!'),
            )
          ],
        ),
      );
    }

    //BuildContext ctx = context;
    try {
      final GlobalKey<ScaffoldState> _scaffoldKey =
          new GlobalKey<ScaffoldState>();
      final std = Students.getCrrentStudent;
      return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                Text(
                  'Account ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.indigo.shade700),
                ),
                //SizedBox(width: 5,),
                Text(
                  'info',
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _scaffoldKey.currentState.hideCurrentSnackBar();
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content:
                          Text('You are not authorization to change data !'),
                      action: SnackBarAction(
                          label: 'Ohk !',
                          onPressed: () =>
                              _scaffoldKey.currentState.hideCurrentSnackBar()),
                      duration: Duration(seconds: 4),
                    ));
                  })
            ],
          ),
          drawer: DrawerScreen(AccountInfoScreen.routeName),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              //margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Student Detail',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue.shade700),
                  ),
                  Divider(),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Username :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'EnRoll No :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.enrollNo.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Email :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.email,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'College :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.location.department,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Department :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.location.course,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Divison :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.location.divison,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Batch :',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    std.location.batch,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.blue.shade600,
                        elevation: 4,
                        onPressed: !_showwidget
                            ? () async {
                                try {
                                  setState(() {
                                    _showwidget = true;
                                    _loading = true;
                                  });
                                  final _auth = FirebaseAuth.instance;
                                  final currentUser = await _auth.currentUser();
                                  await _auth.sendPasswordResetEmail(
                                    email: currentUser.email,
                                  );
                                  setState(() {
                                    _loading = false;
                                  });
                                  await _showErrorDialog('Succesfull !!!',
                                      'Check your associative email And Go to link for reset password');
                                } on PlatformException catch (error) {
                                  setState(() {
                                    _showwidget = false;
                                    _loading = false;
                                  });
                                  await _showErrorDialog(
                                      'A error Occoured !!', error.message);
                                } catch (error) {
                                  setState(() {
                                    _showwidget = false;
                                    _loading = false;
                                  });
                                  await _showErrorDialog(
                                      'A error Occoured !!', error);
                                }
                              }
                            : null,
                        child: Text(
                          'Reqest for Change Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (_showwidget)
                        _loading
                            ? Container(
                                width: 27,
                                height: 27,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.pink.shade300,
                                  strokeWidth: 2,
                                ),
                              )
                            : Icon(
                                Icons.check,
                                color: Colors.indigo.shade500,
                                size: 30,
                              )
                    ],
                  )
                ],
              ),
            ),
          ));
    } catch (error) {
      final GlobalKey<ScaffoldState> _scaffoldKey =
          new GlobalKey<ScaffoldState>();
      return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: <Widget>[
                Text(
                  'Account ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.indigo.shade700),
                ),
                //SizedBox(width: 5,),
                Text(
                  'info',
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _scaffoldKey.currentState.hideCurrentSnackBar();
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content:
                          Text('You are not authorization to change data !'),
                      action: SnackBarAction(
                          label: 'Ohk !',
                          onPressed: () =>
                              _scaffoldKey.currentState.hideCurrentSnackBar()),
                      duration: Duration(seconds: 4),
                    ));
                  })
            ],
          ),
          drawer: DrawerScreen(AccountInfoScreen.routeName),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.sentiment_neutral,
                color: Colors.grey[400],
                size: 45,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Restart Application / Check internet Connection',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          )));
    }
  }
}
