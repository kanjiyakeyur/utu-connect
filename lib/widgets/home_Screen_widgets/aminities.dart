import 'package:flutter/material.dart';
class Aminities extends StatelessWidget {
  
  Widget _grdilyViews(IconData icon,String title,var boxSize){
    return Container(
      height: 70,
      width: (boxSize - 57) / 2,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: boxSize*0.14,
            width: boxSize*0.14,
            color: Colors.indigo,
            child: Icon(icon,color: Colors.white,size: boxSize*0.08,),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(title,
            //overflow:  TextOverflow.ellipsis ,
            softWrap: true,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            )
          )
        ],
      ),
    );
  } 



  @override
  Widget build(BuildContext context) {
    var boxSize = MediaQuery.of(context).size.width;
    return Container(
            margin: EdgeInsets.only(left : 17,right: 10,top: 10,bottom: 7),
            child : Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('OUR AMINITIES',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )),
                SizedBox(height: 8,),
                Container(
                  //padding: EdgeInsets.only(),
                  child: Text('Uka Tarsadia University Provides Many facility within the campus for all boys and girls.',
                    softWrap: true,
                    style: TextStyle(
                      color : Colors.black54
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _grdilyViews(Icons.library_books,'Libraries',boxSize),
                          _grdilyViews(Icons.airport_shuttle,'Trasport',boxSize)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _grdilyViews(Icons.business,'hostel',boxSize),
                          _grdilyViews(Icons.directions_bike,'Sports',boxSize)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _grdilyViews(Icons.home,'Auditorium',boxSize),
                          _grdilyViews(Icons.wifi,'WiFi',boxSize)
                        ],
                      )
                    ],
                  ),
                )

              ],
            )
          );
  }
}