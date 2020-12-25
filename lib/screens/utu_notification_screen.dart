import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utu_connect/widgets/show_notification.dart';
import '../provider/student.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class UtuNotificationScreen extends StatelessWidget {
  static const routeName = '/notifactionScreen';
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Colors.indigo.shade800,
      Color.fromARGB(75, 255, 0, 205),
    ],
  ).createShader(Rect.fromLTWH(135.0, 0.0, 150.0, 70.0));
  @override
  Widget build(BuildContext context) {
    final currentStudent = Students.getCrrentStudent;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              expandedHeight: 100.0,
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
                    'assets/images/Mega.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Container(
                      width: 50,
                    ),
                    Text(
                      'Notices',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          //color: Colors.white
                          shadows: [
                            Shadow(color: Colors.white, blurRadius: 10)
                          ],
                          foreground: Paint()..shader = linearGradient),
                    ),
                    //SizedBox(width: 5,),
                  ],
                ),
                // background: Image.network(
                //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //   fit: BoxFit.cover,
                // )
              ),
            ),
          ];
        },
        body: SafeArea(
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('notification')
                  .orderBy('datetime')
                  .snapshots(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final d = snapshot.data.documents;
                final data = d.reversed.toList();
                List<dynamic> reloadData = [];
                for (var item in data) {
                  //print(item.documentID);
                  bool _isemptyDate =
                      item['expiredate'] == 'EmptyLastDate123' ? true : false;
                  bool _isNotexpire = true;
                  if (!_isemptyDate) {
                    _isNotexpire = DateTime.parse(item['expiredate'])
                            .isAfter(DateTime.now())
                        ? true
                        : false;
                  }
                  if (_isemptyDate || _isNotexpire) {
                    if (item['location']['department'].toString() == 'All') {
                      reloadData.add(item);
                    } else {
                      if (currentStudent.location.department ==
                          item['location']['department'].toString()) {
                        if (item['location']['course'].toString() == 'All') {
                          reloadData.add(item);
                        } else {
                          if (currentStudent.location.course ==
                              item['location']['course'].toString()) {
                            if (item['location']['divison'].toString() ==
                                'All') {
                              reloadData.add(item);
                            } else {
                              if (currentStudent.location.divison ==
                                  item['location']['divison'].toString()) {
                                if (item['location']['batch'].toString() ==
                                    'All') {
                                  reloadData.add(item);
                                } else {
                                  if (currentStudent.location.batch ==
                                      item['location']['batch'].toString()) {
                                    reloadData.add(item);
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                return AnimationLimiter(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: reloadData.length,
                      itemBuilder: (ctx, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 400),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 5, left: 5),
                                child: ShowNotification(
                                  title: reloadData[index]['title'],
                                  description: reloadData[index]['description'],
                                  byName: reloadData[index]['by'],
                                  date: DateTime.parse(
                                      reloadData[index]['datetime']),
                                  link: reloadData[index]['link'],
                                  expiredate: reloadData[index]['expiredate'],
                                  imageUrl: reloadData[index]['image'],
                                ),
                              ),
                            ),
                          ),
                        );
                        //return Text(reloadData[index].documentID);
                      }),
                );
              }),
        ),
      ),
    );
  }
}
