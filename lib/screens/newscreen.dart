import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  static const routeName = 'newscreen';
  final List<dynamic> data;
  NewScreen(this.data);
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (ctx, index) {
            return Text(widget.data[index].documentID);
          }),
    );
  }
}
