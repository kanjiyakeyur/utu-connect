import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utu_connect/widgets/show_notification.dart';
import '../provider/student.dart';

class UtuNotificationScreen extends StatelessWidget {
  static const routeName = '/notifactionScreen';
  @override
  Widget build(BuildContext context) {
    final currentStudent = Students.getCrrentStudent;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices'),
        centerTitle: true,
      ),
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
                  _isNotexpire =
                      DateTime.parse(item['expiredate']).isAfter(DateTime.now())
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
                          if (item['location']['divison'].toString() == 'All') {
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
              return Center(
                child: ListView.builder(
                    itemCount: reloadData.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: ShowNotification(
                          title: reloadData[index]['title'],
                          description: reloadData[index]['description'],
                          byName: reloadData[index]['by'],
                          date: DateTime.parse(reloadData[index]['datetime']),
                          link: reloadData[index]['link'],
                          expiredate: reloadData[index]['expiredate'],
                        ),
                      );
                      //return Text(reloadData[index].documentID);
                    }),
              );
            }),
      ),
    );
  }
}
