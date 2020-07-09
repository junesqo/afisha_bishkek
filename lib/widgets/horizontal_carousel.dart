//import 'dart:html';

import 'package:bishkekevents/helper/colorsys.dart';
import 'package:flutter/material.dart';
import 'package:bishkekevents/models/event_model.dart';
import 'package:bishkekevents/screens/event_screen.dart';

class HorizontalCarousel extends StatefulWidget {
  final String thetitle;
//  PopularToday(this.thetitle);

  const HorizontalCarousel({Key key, this.thetitle}) : super(key: key);

  @override
  _HorizontalCarouselState createState() => _HorizontalCarouselState();
}

class _HorizontalCarouselState extends State<HorizontalCarousel> {
  List<EventModel> eventList = EventModel.list;

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
                  widget.thetitle,
                  style: TextStyle(
                    fontSize: 16.0,
//                    fontFamily: 'Jost',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: 24,
                  color: Colorsys.black,
                  onPressed: () {},
                )
              ]),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 227.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: eventList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EventScreen(),
                        settings: RouteSettings(arguments: eventList[index])),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 0.0),
                    child: Container(
                      height: 219.0,
                      width: 250.0,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.zero,
                                bottomLeft: Radius.zero),
//                            child: Hero(
//                              tag: "image${eventList[index].imgPath}",
                            child: Image(
                              image: AssetImage(
                                  "assets/${eventList[index].imgPath}"),
                              width: 250.0,
                              height: 131.0,
                              fit: BoxFit.cover,
                            ),
//                            ),
                          ),
                          Container(
                            height: 88.0,
                            width: 250.0,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 0.2), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                )),
                            child: Row(
                              children: <Widget>[
                                Container(
//                                  height: 40.0,
                                  width: 28.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 16.0),
                                      Text(
                                        "${eventList[index].date}",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
//                                            fontFamily: 'Jost',
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      Text(
                                        "${eventList[index].month}",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  height: 72.0,
                                  width: 198.0,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
//                                      height: 64.0,
//                                        width: 206.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(height: 2.0),
                                              Text(
                                                "${eventList[index].name}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  height: 1.0,
                                                  fontSize: 13.0,
//                                                height: 13.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
//                                            SizedBox(height: 10.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        "${eventList[index].time}",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
//                                                height: 16.0,
//                                                          fontFamily: 'Jost',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${eventList[index].organization}",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
//                                                height: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black45,
//                                                          fontFamily: 'Jost',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(Icons.favorite_border,
                                                      size: 24.0)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
