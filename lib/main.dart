import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//screens
import './screens/home_screen.dart';
import './screens/student_login_screen.dart';
import './screens/sis_screen.dart';
import './screens/help_screen.dart';
import './screens/Account_info_scrren.dart';
import './screens/department_details_screen.dart';
import './screens/login_screen.dart';
import './screens/splash_screen.dart';
import 'screens/utu_notification_screen.dart';
//provider
import './provider/notification.dart';
import './provider/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Students(),
        ),
        ChangeNotifierProxyProvider<Students, UtuNotification>(
            update: (context, stud, priviousNotification) => UtuNotification(
                stud.token,
                priviousNotification == null
                    ? []
                    : priviousNotification.notification)),
      ],
      child: Consumer<Students>(
        builder: (ctx, std, _) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.indigo.shade50,
            accentColor: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (ctx, auth) {
                if (auth.hasData) {
                  return FutureBuilder(
                      future: std.fatchStudentDeatils(),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SplashScreen();
                        }
                        //return Test();
                        return HomeScreen();
                      });
                } else if (auth.hasError) {
                  FirebaseAuth.instance.signOut();
                  return LoginScreen();
                }
                return LoginScreen();
              }),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            StudentLoginScreen.routeName: (ctx) => StudentLoginScreen(),
            SisScreen.routeName: (ctx) => SisScreen(),
            HelpScreen.routeName: (ctx) => HelpScreen(),
            UtuNotificationScreen.routeName: (ctx) => UtuNotificationScreen(),
            AccountInfoScreen.routeName: (ctx) => AccountInfoScreen(),
            DepartmentDetailsScreen.routeName: (ctx) =>
                DepartmentDetailsScreen(),
          },
        ),
      ),
    );
  }
}
