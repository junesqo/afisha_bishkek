import 'package:bishkekevents/helper/colorsys.dart';
import 'package:bishkekevents/models/event_model.dart';
import 'package:bishkekevents/widgets/near_events.dart';
import 'package:bishkekevents/widgets/horizontal_carousel.dart';
import 'package:bishkekevents/widgets/products.dart';
import 'package:bishkekevents/widgets/special_offer.dart';
import 'package:bishkekevents/widgets/topicc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventModel> eventList = EventModel.list;
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 24.0),
      child: SizedBox(
        height: 2000,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
//                Padding(
//                  padding: EdgeInsets.only(left: 28),
            Text(
              'Афиша мероприятий \nв Бишкеке',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Jost',
                fontSize: 24,
                color: Colors.black,
                height: 1,
              ),
//                  ),
            ),
            SearchBar(),
            Row(children: <Widget>[
              SizedBox(width: 12),
              TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.pink,
                tabs: [
                  Tab(text: 'Рекомендации'),
                  Tab(text: 'Подписки'),
                ],
                labelStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                labelColor: Colorsys.black,
                unselectedLabelColor: Colorsys.lightGrey,
                isScrollable: true,
                controller: tabController,
              ),
//                  SizedBox(width: 20)
            ]),
            SizedBox(height: 20),
            Expanded(
              child: TabBarView(children: <Widget>[
                Recommendations(),
                MySubscriptions(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0.2), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Искать мероприятия",
          hintStyle: TextStyle(
              fontSize: 14,
//              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
              color: Colorsys.lightGrey),
          border: InputBorder.none,
          icon: Icon(Icons.search, size: 20.0),
        ),
      ),
    );
  }
}

class Recommendations extends StatefulWidget {
  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 12),
      TopiccCarousel(),
      SizedBox(height: 24.0),
      SpecialOffer(),
      SizedBox(height: 24.0),
      NearEventsTile(shortlist: 3),
      SizedBox(height: 24.0),
    ]);
  }
}

class MySubscriptions extends StatefulWidget {
  @override
  _MySubscriptionsState createState() => _MySubscriptionsState();
}

class _MySubscriptionsState extends State<MySubscriptions> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Container(height: 280.0, child: Products())],
    );
  }
}
