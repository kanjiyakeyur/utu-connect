import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:utu_connect/provider/notification.dart';
import 'package:provider/provider.dart';
import 'package:utu_connect/screens/help_screen.dart';
import './sis_screen.dart';
import './home_screen.dart';
import './student_login_screen.dart';
import './Account_info_scrren.dart';
//import '../main.dart' as main;

class DrawerScreen extends StatelessWidget {
  final routeName;

  DrawerScreen(this.routeName);

  //Widget sideIcons(Icon icon,)

  @override
  Widget build(BuildContext context) {
    //final mediaheight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        //top: mediaheight*0.065,
        //bottom: MediaQuery.of(context).size.height*0.10,
        left: mediaWidth * 0.20,
        right: mediaWidth * 0.20,
      ),
      color: Colors.black54,
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              height: 180,
              width: 90,
              decoration: BoxDecoration(
                //color: Colors.white54,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.grey[100],
                ),
              ),
              onPressed: () {
                //Navigator.pop(context,true);
                if (routeName == HomeScreen.routeName) {
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  //Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
              },
              color: Colors.white,
              icon: Icon(
                Icons.home,
                color: routeName == HomeScreen.routeName
                    ? Colors.pink.shade300
                    : Colors.black45,
              ),
              label: Text(
                'Home',
                style: TextStyle(
                  color: routeName == HomeScreen.routeName
                      ? Colors.pink.shade300
                      : Colors.black45,
                  //fontSize: 20
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[100])),
              onPressed: () {
                if (routeName == HomeScreen.routeName) {
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: StudentLoginScreen(),
                      type: PageTransitionType.fade));
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: StudentLoginScreen(),
                      type: PageTransitionType.fade));
                }
              },
              icon: Icon(
                Icons.person,
                color: routeName == StudentLoginScreen.routeName
                    ? Colors.pink.shade300
                    : Colors.black45,
              ),
              color: Colors.white,
              label: Text(
                'Student Login',
                style: TextStyle(
                  color: routeName == StudentLoginScreen.routeName
                      ? Colors.pink.shade300
                      : Colors.black45,
                  //fontSize: 20
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[100])),
              onPressed: () {
                if (routeName == HomeScreen.routeName) {
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: SisScreen(), type: PageTransitionType.fade));
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: SisScreen(), type: PageTransitionType.fade));
                }
              },
              icon: Icon(
                Icons.assignment_ind,
                color: routeName == SisScreen.routeName
                    ? Colors.pink.shade300
                    : Colors.black45,
              ),
              label: Text(
                'SiS',
                style: TextStyle(
                  color: routeName == SisScreen.routeName
                      ? Colors.pink.shade300
                      : Colors.black45,
                  //fontSize: 20
                ),
              ),
              color: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[100])),
              onPressed: () {
                if (routeName == HomeScreen.routeName) {
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: AccountInfoScreen(),
                      type: PageTransitionType.fade));
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: AccountInfoScreen(),
                      type: PageTransitionType.fade));
                }
                //Navigator.of(context).pushReplacementNamed(AccountInfoScreen.routeName);
              },
              icon: Icon(
                Icons.assignment,
                color: routeName == AccountInfoScreen.routeName
                    ? Colors.pink.shade300
                    : Colors.black45,
              ),
              color: Colors.white,
              label: Text(
                'Account',
                style: TextStyle(
                  color: routeName == AccountInfoScreen.routeName
                      ? Colors.pink.shade300
                      : Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[100])),
              onPressed: () {
                if (routeName == HomeScreen.routeName) {
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: HelpScreen(), type: PageTransitionType.fade));
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.of(context).push(PageTransition(
                      child: HelpScreen(), type: PageTransitionType.fade));
                }
                //Navigator.of(context).pushReplacementNamed(HelpScreen.routeName);
              },
              icon: Icon(
                Icons.help_outline,
                color: routeName == HelpScreen.routeName
                    ? Colors.pink.shade300
                    : Colors.black45,
              ),
              color: Colors.white,
              label: Text(
                'Help',
                style: TextStyle(
                  color: routeName == HelpScreen.routeName
                      ? Colors.pink.shade300
                      : Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.red,
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                await FirebaseAuth.instance.signOut();
                //Provider.of<Students>(context, listen: false).logout();
                Provider.of<UtuNotification>(context, listen: false).logout();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
