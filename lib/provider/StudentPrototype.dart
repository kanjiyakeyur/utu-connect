import 'package:utu_connect/provider/department.dart';
import 'package:flutter/foundation.dart';

class Student{
  final String userid;
  final String email;
  final String enrollNo;
  final String name; 
  final UtuDepartment location;

  Student({
    @required this.userid,
    @required this.email,
    @required this.enrollNo,
    @required this.name,
    @required this.location,
  });
}