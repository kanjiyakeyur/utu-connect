import 'dart:async';

import 'package:utu_connect/provider/department.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import './StudentPrototype.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Students with ChangeNotifier {
  String _token;
  DateTime _expireDate;
  String _userId;
  String _email;
  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userid {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _userId;
    }
    return null;
  }

  static Student _currentStudent;
  static Student get getCrrentStudent {
    return _currentStudent;
  }

  //Future<void> fatchStudentData() async {
  //  try{
  //    final url = 'https://utuconnect.firebaseio.com/students/$_userId.json?auth=$_token';
  //    final response = await http.get(url);
  //    final responseData = json.decode(response.body);
  //   print('\n\n\n\n\n\n\n\n$responseData');
  //   //{email: test@gmail.com, enrollNo: 201703100820111, location: {batch: 2, course: CO,
  //   //department: Enginerring, divison: B}, name: Arvind Kanjiya}
  //    _currentStudent = Student(
  //      userid: _userId.toString(),
  //      email: responseData['email'].toString(),
  //      enrollNo: responseData['enrollNo'].toString(),
  //      name: responseData['name'].toString(),
  //      location: UtuDepartment(
  //        department: responseData['location']['Enginerring'].toString(),
  //        course: responseData['location']['course'].toString(),
  //        batch: responseData['location']['batch'].toString(),
  //        divison: responseData['location']['divison'].toString()
  //      )
  //    );
  //    print('\n\n\n\nffldfljfljdfljdlfjdjfldn\n\n\n\n');
  //  }
  //  catch(error){
  //    throw error;
  //  }
  //}
  Future<void> fatchStudentDeatils() async {
    try {
      if (_userId == null) {
        var re = await FirebaseAuth.instance.currentUser();
        _userId = re.uid;
        _email = re.email;
      }
      final firestore = Firestore.instance.collection('student');
      var data = await firestore.document('$_userId').get();
      if (data.data == null) {
        await FirebaseAuth.instance.signOut();
        throw 'Not Authorize to Login';
      }
      _currentStudent = Student(
        userid: _userId.toString(),
        email: _email.toString(),
        enrollNo: data.data['enrollno'].toString(),
        name: data.data['name'].toString(),
        location: UtuDepartment(
          department: data.data['location']['department'].toString(),
          course: data.data['location']['course'].toString(),
          batch: data.data['location']['batch'].toString(),
          divison: data.data['location']['divison'].toString(),
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      AuthResult re;
      re = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _userId = re.user.uid;
      _email = re.user.email;
      await fatchStudentDeatils();
    } catch (error) {
      throw error;
    }
  }

//  Future<void> tryAutoLogin()async{
//    final prfs = await SharedPreferences.getInstance();
//    if(!prfs.containsKey('userData')){
//      return false;
//    }
//    final exterctedData = json.decode(prfs.get('userData'))as Map<String,Object>;
//    final expireDate = DateTime.parse(exterctedData['expireDate']);
//    if(expireDate.isBefore(DateTime.now())){
//      return false;
//    }
//    _token = exterctedData['token'];
//    _userId = exterctedData['userid'];
//    _expireDate = expireDate;
//    await fatchStudentDeatils();
//    notifyListeners();
//    _autoLogout();
//    return true;
//  }
//
//  Future<void> logout() async{
//    _token =null;
//    _userId = null;
//    _expireDate = null;
//    if(_authTimer != null){
//      _authTimer.cancel();
//      _authTimer = null;
//    }
//    notifyListeners();
//    final prefs = await SharedPreferences.getInstance();
//    prefs.clear();
//  }
//
//  void _autoLogout(){
//    if(_authTimer != null){
//      _authTimer.cancel();
//    }
//    final timeToExprie = _expireDate.difference(DateTime.now()).inSeconds;
//    _authTimer = Timer(Duration(seconds: timeToExprie),logout);
//  }
}
