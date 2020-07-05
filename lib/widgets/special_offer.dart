import 'package:flutter/material.dart';
import 'package:bishkekevents/models/event_model.dart';
import 'package:bishkekevents/screens/event_screen.dart';

class SpecialOffer extends StatefulWidget {
  @override
  _SpecialOfferState createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  List<String> eventtitles = ["Длиное название мероприятия с деталями"];
  List<String> organizations = ["ООО Организация"];
  List<String> dates = ["11", "12", "13", "14", "15"];
  List<String> months = ["СЕН", "АВГ"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Специальное предложение',
                  style: TextStyle(
                    fontSize: 16.0,
//                    fontFamily: 'Jost',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: 24,
                  color: Colors.black,
                  onPressed: () {},
                )
              ]),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomRight: Radius.zero,
                    bottomLeft: Radius.zero),
                child: Image(
                  image: AssetImage("assets/7.jpg"),
                  width: MediaQuery.of(context).size.width - 48,
                  height: 175.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 0.2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: Column(
                  //white space
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Container(
                          //the date
//                                  height: 40.0,
                          width: 44.0,
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
//                              SizedBox(height: 16.0),
                              Text(
                                dates.first,
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
//                                    fontFamily: 'Jost',
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                months.first,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          height: 96.0,
                          width: 250.0,
                          child: Column(
                            children: <Widget>[
                              Container(
//                                      height: 64.0,
//                                        width: 206.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
//                                  SizedBox(height: 4.0),
                                    Text(
                                      eventtitles.first,
                                      style: TextStyle(
                                        height: 1.15,
                                        fontSize: 13.0,
//                                                height: 13.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '16:00 - 18:00',
                                          style: TextStyle(
                                            fontSize: 12.0,
//                                                height: 16.0,
//                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        Text(
                                          organizations.first,
                                          style: TextStyle(
                                            fontSize: 12.0,
//                                                height: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black45,
//                                            fontFamily: 'Jost',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
//                                              SizedBox(width: 20),
                                              Text(
                                                '+ 2 друга',
                                                style: TextStyle(
//                                                  fontFamily: 'Jost',
                                                  fontSize: 11,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Icon(Icons.favorite_border,
                                                  size: 24.0)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
//                    SizedBox(height: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
