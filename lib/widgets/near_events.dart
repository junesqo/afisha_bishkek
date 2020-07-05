import 'package:flutter/material.dart';
import 'package:bishkekevents/models/event_model.dart';
import 'package:bishkekevents/screens/event_screen.dart';

class NearEventsTile extends StatefulWidget {
  final int shortlist;
  const NearEventsTile({Key key, this.shortlist}) : super(key: key);

  @override
  _NearEventsTileState createState() => _NearEventsTileState();
}

class _NearEventsTileState extends State<NearEventsTile> {
  List<EventModel> eventList = EventModel.list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Мероприятия рядом',
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
        Container(
          child: ListView.builder(
              itemCount: widget.shortlist,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EventScreen(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 20.0),
                    child: Container(
                      height: 88,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 0.2), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: AssetImage(
                                  "assets/${eventList[index].imgPath}"),
                              height: 88,
                              width: 88,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 16),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${eventList[index].name}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
//                                        fontFamily: 'Jost',
                                        fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${eventList[index].organization}",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w600,
//                                        fontFamily: 'Jost',
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "${eventList[index].kmAway}",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
//                                        fontFamily: 'Jost',
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
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
