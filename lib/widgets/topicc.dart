import 'package:flutter/material.dart';
import 'package:bishkekevents/screens/event_screen.dart';

class TopiccCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Container(
              height: 32.0,
              width: 378.0,
              child: Text(
                'Предложенные темы',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 0.2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                  width: 100.0,
                  height: 32.0,
                  child: Center(
                      child: Text(
                    'Сегодня',
                    style: TextStyle(
//                        fontFamily: 'Jost',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 0.2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                  width: 100.0,
                  height: 32.0,
                  child: Center(
                      child: Text(
                    'Завтра',
                    style: TextStyle(
//                        fontFamily: 'Jost',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 0.2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                  width: 100.0,
                  height: 32.0,
                  child: Center(
                      child: Text(
                    'Выходные',
                    style: TextStyle(
//                        fontFamily: 'Jost',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ],
            ),
          )
        ]);
  }
}
