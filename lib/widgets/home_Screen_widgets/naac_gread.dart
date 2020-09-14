import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NaacGread extends StatelessWidget {
  _launchUrl() async {
    const url = 'http://utu.ac.in/SSR/download/Final%20SSR.pdf';
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: 'NAAC Accredited \'',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'B+',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.indigo),
                ),
                TextSpan(
                  text: '\' Grade with CGPA ',
                ),
                TextSpan(
                  text: '2.17',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.indigo),
                ),
                TextSpan(
                  text: ' . ',
                ),
              ],
            ),
          ),
          //Row(
          //  children: <Widget>[
          //    Text(
          //      'NAAC Accredited \'',
          //      style: TextStyle(fontSize: 18),
          //    ),
          //    Text(
          //      'B+',
          //      style: TextStyle(
          //          fontSize: 24,
          //          fontWeight: FontWeight.w500,
          //          color: Colors.indigo),
          //    ),
          //    Text(
          //      '\' Grade with ',
          //      softWrap: true,
          //      style: TextStyle(fontSize: 18),
          //    ),
          //  ],
          //),
          //Row(
          //  children: <Widget>[
          //    Text(
          //      'CGPA ',
          //      softWrap: true,
          //      style: TextStyle(fontSize: 18),
          //    ),
          //    Text(
          //      '2.17',
          //      style: TextStyle(
          //          fontSize: 20,
          //          fontWeight: FontWeight.w500,
          //          color: Colors.indigo),
          //    ),
          //  ],
          //),
          SizedBox(
            height: 5,
          ),
          RaisedButton(
              onPressed: _launchUrl,
              color: Colors.indigo[500],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Download Report',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
