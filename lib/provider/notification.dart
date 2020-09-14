//import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import './department.dart';
import 'package:http/http.dart' as http;
//import './http_exception.dart';
import 'dart:convert';
import './student.dart';
import './StudentPrototype.dart';

class NotificationType
{
  final String id;
  final String title;
  final String discription;
  final DateTime datetime;
  final UtuDepartment department;
  final String byid;
  final String by;
  NotificationType({
    @required this.id,
    @required this.title,
    @required this.discription,
    @required this.datetime,
    @required this.department,
    @required this.by,
    @required this.byid,
  });
}

class UtuNotification with ChangeNotifier {
  List<NotificationType> _notification = [];

  List<NotificationType> get notification{
    return [..._notification];
  }

  var _fatchData = false;

  bool get fatchedData{
    return _fatchData;
  }

  int get itemCount {
    return _notification.length;
  }

  final String token;
  UtuNotification(this.token,this._notification);


  _addNotification(List xyz,String id,dynamic data){
    xyz.add(
        NotificationType(
          id: id.toString(), 
          title: data['title'].toString(), 
          discription: data['discription'].toString(),
          datetime: DateTime.parse(data['datetime']),
          department: UtuDepartment(
            department: data['department']['department'].toString(),
            course:  data['department']['course'].toString(),
            divison: data['department']['divison'].toString(),
            batch: data['department']['batch'].toString()
          ),
          by : data['by'].toString(),
          byid : data['byid'].toString(),
        ),
      );
    //notifyListeners();
  }

  logout(){
    _notification.clear();
    _fatchData = false;
    notifyListeners();
  }

  Future<void> fatchAndSet() async {
    try{
    final url = 'https://utuconnect.firebaseio.com/notifications.json?auth=$token';
    final response = await http.get(url);
    final responseData = json.decode(response.body) as Map<String,dynamic>;
    //print(responseData);
    if(responseData == null){
      return ;
    }
    //_notification.clear();
    final Student currentStudent = Students.getCrrentStudent;
    List<NotificationType> reloadDataList =[];
    responseData.forEach((id, data) {
      //print(id);
      if(data['department']['department'].toString() == 'All'){
        _addNotification(reloadDataList,id, data);
      }
      else{
        if (currentStudent.location.department == data['department']['department'].toString())
        {
          if(data['department']['course'].toString() == 'All'){
            _addNotification(reloadDataList,id, data);
          }
          else{
            if (currentStudent.location.course == data['department']['course'].toString())
            {
              if(data['department']['divison'].toString() == 'All'){
                _addNotification(reloadDataList,id, data);
              }
              else{
                if (currentStudent.location.divison == data['department']['divison'].toString())
                {
                  if(data['department']['batch'].toString() == 'All'){
                    _addNotification(reloadDataList,id, data);
                  }
                  else{
                    if (currentStudent.location.batch == data['department']['batch'].toString()){
                      _addNotification(reloadDataList,id, data);
                    }
                  }
                }
              } 
            }
          }
        }
      }
    });
     _notification = reloadDataList;
     _fatchData = true;
    notifyListeners();
    }
    catch(error){
      throw error;
    }


  }
}