import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/notification.dart';
//import 'package:provider/provider.dart';
//import '../provider/notification.dart';
import './drawer_screen.dart';
import './utu_notification_screen.dart';
import '../widgets/home_Screen_widgets/image_slider.dart';
import '../widgets/home_Screen_widgets/aminities.dart';
import '../widgets/home_Screen_widgets/naac_gread.dart';
import '../widgets/home_Screen_widgets/why_choose_us.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    //final dh = MediaQuery.of(context).size.height;
    //final dw = MediaQuery.of(context).size.width;
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
              'Connect',
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(UtuNotificationScreen.routeName),
            icon: Icon(
              Icons.notifications_active,
              color: Theme.of(context).errorColor,
            ),
          )
        ],
      ),
      drawer: DrawerScreen(routeName),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<UtuNotification>(context, listen: false).fatchAndSet(),
        child: ListView(
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
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.pink[200],
                child: Aminities()),
            //Divider(thickness: 1,indent: 15,endIndent: 15,),
            Card(
              margin: EdgeInsets.all(15),
              child: WhyChooseUs(),
              shadowColor: Colors.pink[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 6,
            ),
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
