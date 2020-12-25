import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './drawer_screen.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = '/help';

  @override
  Widget build(BuildContext context) {
    //var mobilehight = MediaQuery.of(context).size.height;
    //var mobileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Text(
              'UTU ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.indigo.shade700),
            ),
            //SizedBox(width: 5,),
            Text(
              'Help & info',
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54),
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (String selectedValue) async {
                if (selectedValue == 'reportBugs') {
                  await launch(
                      'mailto:kanjiyakeyur01@gmail.com?subject=Report Bugs&body=Please attach a Screenshots!!!');
                }
              },
              icon: Icon(Icons.more_vert),
              offset: Offset(0, 50),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Report Bugs',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.bug_report)
                        ],
                      ),
                      value: 'reportBugs',
                    ),
                  ])
        ],
      ),
      drawer: DrawerScreen(routeName),
      body: ListView(
        physics: BouncingScrollPhysics(),
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Column(
            children: <Widget>[
              Container(
                  height: 150,
                  width: 160,
                  child: Image.asset(
                    'assets/images/utulogo.png',
                    fit: BoxFit.cover,
                  )),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'For more information visit : ',
                style: TextStyle(fontSize: 15),
              ),
              FlatButton(
                  onPressed: () async {
                    await launch('http://www.utu.ac.in/');
                  },
                  child: Text(
                    'http://www.utu.ac.in/',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'Contect Us: ',
                style: TextStyle(fontSize: 15),
              ),
              FlatButton(
                  onPressed: () async {
                    await launch(
                        'mailto:utumangement@utu.com?subject=Information Help&body=Ask Quetions');
                  },
                  child: Text(
                    'UtuMangement@utu.com',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                  )),
              Text('or'),
              FlatButton(
                  onPressed: () async {
                    await launch('tel:+91 123456789');
                  },
                  child: Text(
                    '+91 1234567890',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  )),
              Text(
                'Follow Us : ',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Image.asset(
                        'assets/images/youtube.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: () async {
                        await launch(
                            'https://www.youtube.com/channel/UC2N7bQCLyHnUnMfTwA8MgMw');
                      }),
                  IconButton(
                      icon: Image.asset(
                        'assets/images/facebook.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: () async {
                        await launch('https://www.facebook.com/placement.utu');
                      }),
                  IconButton(
                      icon: Image.asset(
                        'assets/images/instagarm.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: () async {
                        await launch(
                            'https://instagram.com/utu.malibacampus?igshid=zc7db9yb3blb');
                      }),
                  IconButton(
                      icon: Image.asset(
                        'assets/images/twitter.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: () async {
                        await launch('https://twitter.com/utumalibacampus');
                      }),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Created By : ',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Keyur Kanjiya',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  Text(
                    '|',
                    style: TextStyle(color: Colors.indigo, fontSize: 15),
                  ),
                  Text(
                    'Milan Vora',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  Text(
                    '|',
                    style: TextStyle(color: Colors.indigo, fontSize: 15),
                  ),
                  Text(
                    'Sohil Gevariya',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              //Expanded(child: null),
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 30,
        color: Colors.black87,
        child: Text(
          'Uka Tarsadia University - 2020 All Rights Reserved',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
