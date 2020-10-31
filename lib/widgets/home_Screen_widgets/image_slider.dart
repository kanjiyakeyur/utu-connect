import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../screens/department_details_screen.dart';
import '../../provider/overviewDepartment.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  final List<OverviewDepartment> imgL = [
    OverviewDepartment(
        id: DateTime.now().toString(),
        image: 'assets/images/cgpit.jpg',
        title: 'CGPIT'),
    OverviewDepartment(
        id: DateTime.now().toString(),
        image: 'assets/images/pharmacy.jpg',
        title: 'Pharmacy'),
    OverviewDepartment(
        id: DateTime.now().toString(),
        image: 'assets/images/cgpit2.jpg',
        title: 'UTU'),
    OverviewDepartment(
        id: DateTime.now().toString(),
        image: 'assets/images/pharmacy2.jpg',
        title: 'Phyiyo'),
    OverviewDepartment(
        id: DateTime.now().toString(),
        image: 'assets/images/cgpit3.jpg',
        title: 'Gardan'),
    OverviewDepartment(
        id: DateTime.now().toString(),
        image: 'assets/images/pharmacy3.jpg',
        title: 'BSC'),
  ];

  //static final List<String> imgList = [
  //'assets/images/cgpit.jpg',
  //'assets/images/pharmacy.jpg',
  //'assets/images/cgpit2.jpg',
  //'assets/images/pharmacy2.jpg',
  //'assets/images/cgpit3.jpg',
  //'assets/images/pharmacy3.jpg'
  //];
  //static final List<String> imgTitle = [
  //  'cgpit','pharmacy','utu','phyiyo','gardan','bsc'
  //];

  List<Widget> imageSliders(BuildContext context) {
    return imgL
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      DepartmentDetailsScreen.routeName,
                      arguments: item),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    elevation: 5,
                    shadowColor: Colors.indigo[300],
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(color: Colors.red, blurRadius: 2)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(children: [
        CarouselSlider(
          items: imageSliders(context),
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgL.map((url) {
            int index = imgL.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.indigo : Colors.pink[100]),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
