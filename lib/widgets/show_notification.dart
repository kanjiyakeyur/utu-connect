import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';

class ShowNotification extends StatefulWidget {
  final String title;
  final String description;
  final String byName;
  final DateTime date;
  final String link;
  final String expiredate;
  final String imageUrl;

  ///final String title;
  //final String description;

  ShowNotification({
    @required this.title,
    @required this.description,
    @required this.byName,
    @required this.date,
    @required this.link,
    @required this.expiredate,
    @required this.imageUrl,
  });

  @override
  _ShowNotificationState createState() => _ShowNotificationState();
}

class _ShowNotificationState extends State<ShowNotification> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    //print(widget.data);
    //for expiredate for ntification
    final bool _isEmptyDate =
        widget.expiredate == 'EmptyLastDate123' ? true : false;
    DateTime _expiredate;
    if (!_isEmptyDate) {
      _expiredate = DateTime.parse(widget.expiredate);
    }

    //for link for notification
    final bool _isLinkEmpty = widget.link == 'EmptyLink123' ? true : false;
    _launchUrl() async {
      var url = widget.link;
      await launch(url);
    }

    return SafeArea(
      child: Wrap(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Card(
                elevation: 4,
                shadowColor: Colors.pink[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          widget.title.toString(),
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            shadows: [
                              Shadow(color: Colors.pink, blurRadius: 1)
                            ],
                          ),
                        ),
                        subtitle: Text(
                          widget.description,
                          //softWrap: true,
                          overflow: !_expanded ? TextOverflow.ellipsis : null,
                        ),
                        trailing: IconButton(
                          icon: _expanded
                              ? Icon(Icons.expand_less)
                              : Icon(Icons.expand_more),
                          onPressed: () {
                            setState(() {
                              _expanded = !_expanded;
                            });
                          },
                        ),
                      ),
                      _expanded
                          ? Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 30, bottom: 10, start: 17),
                              child: Column(
                                children: <Widget>[
                                  if (!_isLinkEmpty)
                                    SizedBox(
                                      height: 5,
                                    ),
                                  if (!_isLinkEmpty)
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: GestureDetector(
                                              onTap: () => _launchUrl(),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Link : ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: widget.link,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.lightBlue,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.content_copy),
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                text: widget.link));
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                "URL Copied to Clipboard",
                                                textAlign: TextAlign.center,
                                              ),
                                            ));
                                          },
                                        ),
                                      ],
                                    ),
                                  if (!_isLinkEmpty)
                                    SizedBox(
                                      height: 10,
                                    ),
                                  if (widget.imageUrl != "EmptyImage")
                                    Container(
                                      child: Image.network(
                                        widget.imageUrl,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text('by : ${widget.byName}')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      //Text('Date : '),
                                      //Text(widget.data.datetime.toString()),
                                      Text(
                                        'Date : ${DateFormat('dd/MM/yyyy hh:mm a').format(widget.date)}',
                                        style: TextStyle(color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      _isEmptyDate
                                          ? Container()
                                          : Text(
                                              'Expire Date : ${DateFormat('dd/MM/yyyy hh:mm a').format(_expiredate)}',
                                              style: TextStyle(
                                                color: Colors.red.shade500,
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ))
                          : Container(),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
