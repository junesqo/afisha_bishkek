import 'package:flutter/material.dart';
import 'package:bishkekevents/helper/colorsys.dart';
import 'package:bishkekevents/models/event_model.dart';
import 'package:bishkekevents/widgets/popular_today.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
//  List<EventModel> eventList = EventModel.list;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final EventModel event = ModalRoute.of(context).settings.arguments;
    String descText = event.description;
    bool descTextShowFlag = false;

    return Scaffold(
      backgroundColor: Colorsys.powder,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorsys.pink,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colorsys.grey,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Image(
                image: AssetImage(event.imgPath),
                width: 250.0,
                height: 131.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                event.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 24,
                    color: Colors.black,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        event.date + event.month,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        event.date,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Добавить в календарь',
                        style: TextStyle(
                          color: Colorsys.pink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 24,
                    color: Colors.black,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        event.address,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Найти на карте',
                        style: TextStyle(
                          color: Colorsys.pink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 32),
              Column(
                children: <Widget>[
                  Text(
                    'Подробнее',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                  SizedBox(height: 8),
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        Text(descText,
                            overflow: TextOverflow.fade,
                            maxLines: descTextShowFlag ? 50 : 3,
                            textAlign: TextAlign.start),
                        InkWell(
                          onTap: () {
                            setState(() {
                              descTextShowFlag = !descTextShowFlag;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              descTextShowFlag
                                  ? Text(
                                      "Скрыть",
                                      style: TextStyle(color: Colorsys.pink),
                                    )
                                  : Text("Показать полностью...",
                                      style: TextStyle(color: Colorsys.pink))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              PopularToday(thetitle: 'Похожие мероприятия'),
            ],
          ),
        ),
      ),
    );
  }
}
