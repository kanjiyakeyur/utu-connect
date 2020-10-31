import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../provider/notification.dart';
import './drawer_screen.dart';
import './utu_notification_screen.dart';
import '../widgets/home_Screen_widgets/image_slider.dart';
import '../widgets/home_Screen_widgets/aminities.dart';
import '../widgets/home_Screen_widgets/naac_gread.dart';
import '../widgets/home_Screen_widgets/why_choose_us.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    //final dh = MediaQuery.of(context).size.height;
    //final dw = MediaQuery.of(context).size.width;

    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        Colors.indigo.shade800,
        Color.fromARGB(75, 255, 0, 205),
      ],
    ).createShader(Rect.fromLTWH(135.0, 0.0, 150.0, 70.0));
    return Scaffold(
      drawer: DrawerScreen(routeName),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: true,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              expandedHeight: 130,
              floating: true,
              pinned: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
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
                          //color: Colors.white
                          shadows: [
                            Shadow(color: Colors.white, blurRadius: 10)
                          ],
                          foreground: Paint()..shader = linearGradient),
                    ),
                    //SizedBox(width: 5,),
                    Text(
                      'Connect',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 20,
                        shadows: [Shadow(color: Colors.white, blurRadius: 5)],
                        //color: Colors.black54,
                        foreground: Paint()..shader = linearGradient,
                      ),
                    ),
                  ],
                ),
                // background: Image.network(
                //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //   fit: BoxFit.cover,
                // )
              ),
              actions: [
                IconButton(
                  onPressed: () => Navigator.of(context).push(PageTransition(
                      child: UtuNotificationScreen(),
                      type: PageTransitionType.fade)),
                  icon: Icon(
                    Icons.notifications_active,
                    color: Theme.of(context).errorColor,
                  ),
                )
              ],
            ),
          ];
        },
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            CarouselWithIndicatorDemo(),
            //Divider(thickness: 1,indent: 15,endIndent: 15,),
            Card(
                margin: EdgeInsets.all(15),
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.pink[200],
                child: NaacGread()),
            //Divider(thickness: 1,indent: 15,endIndent: 15,),
            Card(
              margin: EdgeInsets.all(15),
              child: WhyChooseUs(),
              shadowColor: Colors.pink[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 6,
            ),
            Card(
              margin: EdgeInsets.all(15),
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.pink[200],
              child: Aminities(),
            ),
            //Divider(thickness: 1,indent: 15,endIndent: 15,),

            //Divider(thickness: 1,indent: 15,endIndent: 15,),
            //SizedBox(height: 300,),
            Container(
              alignment: Alignment.center,
              height: 40,
              color: Colors.black87,
              child: Text(
                'Uka Tarsadia University - 2020 All Rights Reserved',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
