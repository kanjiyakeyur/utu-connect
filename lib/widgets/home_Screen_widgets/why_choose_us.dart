import 'package:flutter/material.dart';

class WhyChooseUs extends StatefulWidget {
  @override
  _WhyChooseUsState createState() => _WhyChooseUsState();
}

class _WhyChooseUsState extends State<WhyChooseUs> {

  bool _expand1;
  bool _expand2;
  bool _expand3;

  @override
  void initState() {
    _expand1 = false;
    _expand2 = false;
    _expand3 = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Why Choose Us?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17
            ),
          ),
          SizedBox(height: 13,),

          GestureDetector(
            onTap: (){setState(() {
                          _expand1 = !_expand1;
                          _expand2 = false;
                          _expand3 = false;
                        });},
                      child: Container(
              color : Colors.grey.shade200,
              child : Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.add,color: _expand1 ? Colors.black87 : Colors.grey,), onPressed: null),
                      Text('Fastest Growing University',
                        style: TextStyle(
                          fontWeight: _expand1 ? FontWeight.w400 : FontWeight.w300
                        ),
                      ),
                     
                    ],
                  ),
                  _expand1 ? Container(
                    padding: EdgeInsets.only(left: 15,right: 5),
                    child: Text('- Fastest growing university in Gujarat with over 9500+ students. \n- Nationally accredited courses reflective of current trends and societal needs.'
                      ,style: TextStyle(
                        fontWeight: FontWeight.w300
                      ),
                    ))
                      : SizedBox(),
                  _expand1 ? SizedBox(height: 8,) : SizedBox(),
                ],
              )
            ),
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              setState(() {
                          _expand1 = false;
                          _expand2 = !_expand2;
                          _expand3 = false;
                        });
            },
                      child: Container(
              color : Colors.grey.shade200,
              child : Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.add,color: _expand2 ? Colors.black87 : Colors.grey,), onPressed: null),
                      Text('Eco-friendly Infrastructure',
                        style: TextStyle(
                          fontWeight: _expand2 ? FontWeight.w400 : FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                  _expand2 ? Container(
                    padding: EdgeInsets.only(left: 15,right: 5),
                    child: Text('- Eco-friendly and ergonomically designed infrastructure .\n- Fully Wi-Fi campus with free-of-cost access.\n- High premium on all round development of students.\n-Best in class hostel facilities with all avenues of learning and recreation.',style: TextStyle(
                        fontWeight: FontWeight.w300
                      ),
                    ))
                  : SizedBox(),
                   _expand2 ? SizedBox(height: 8,) : SizedBox(),
                ],
              )
            ),
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              setState(() {
                          _expand1 = false;
                          _expand2 = false;
                          _expand3 = !_expand3;
                        });
            },
            child: Container(
              color : Colors.grey.shade200,
              child : Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.add,color: _expand3 ? Colors.black87 : Colors.grey,), onPressed: (){
                        setState(() {
                          _expand1 = false;
                          _expand2 = false;
                          _expand3 = !_expand3;
                        });
                      }),
                      Text('Job Fair & Campus placement',
                        style: TextStyle(
                          fontWeight: _expand3 ? FontWeight.w400 : FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                  _expand3 ? Container(
                    padding: EdgeInsets.only(left: 15,right: 5),
                    child: Text('- Job fair and campus placement with very high success ratio.\n- Scholarships to needy and meritorious students.\n- Three spacious auditoriums with multi-media facilities.',style: TextStyle(
                        fontWeight: FontWeight.w300
                      ),
                    ))
                  : SizedBox(),
                   _expand3 ? SizedBox(height: 8,) : SizedBox(),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}