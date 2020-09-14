import 'package:flutter/material.dart';
import '../provider/overviewDepartment.dart';
class DepartmentDetailsScreen extends StatelessWidget {
  
  static const routeName = '/DepartmentDetails';
  @override
  Widget build(BuildContext context) {
    final OverviewDepartment data = ModalRoute.of(context).settings.arguments;
    //print(data);
    return Scaffold(
      appBar: AppBar(
        title : Text(data.title,
        style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
                color: Colors.indigo.shade700
              ),
        ),
      ),
      body: Container(
        child : Image.asset(data.image, fit: BoxFit.cover, width: 1000.0),
      )
    );
  }
}