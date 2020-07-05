import 'package:bishkekevents/screens/home_screen.dart';
import 'package:bishkekevents/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:bishkekevents/screens/userscreen.dart';
import 'package:bishkekevents/helper/colorsys.dart';
import 'package:bishkekevents/models/event_model.dart';
import 'package:bishkekevents/screens/library_screen.dart';

class MyDivider extends Divider implements PreferredSizeWidget {
  MyDivider({
    Key key,
    height = 1.0,
    indent = 0.0,
    color,
  })  : assert(height >= 0.0),
        super(
          key: key,
          height: height,
          indent: indent,
          color: color,
        ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<EventModel> eventList = EventModel.list;

  int sectionIndex = 0; //текущий индекс навбар айтема = 0, т.е. ХомСкрин

  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); //final to open drawer by icon

  void _onItemTapped(int index) {
    //индексатор выбранной страницы в навбаре
    setState(() {
      sectionIndex = index;
    });
  }

  List<Widget> _fill = <Widget>[
    //fill это начинка - страница которая будет отображаться в оболочке готового аппбара, drawera и навбара
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        key: _scaffoldKey, //key to open drawer by icon
//        resizeToAvoidBottomInset: false,
        backgroundColor: Colorsys.powder,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colorsys.powder,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colorsys.grey,
            ),
          ),
          bottom: MyDivider(),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colorsys.pink,
                ),
              ),
              ListTile(
                title: Text('Мои интересы'),
                trailing: Icon(Icons.category),
                onTap: () {},
              ),
//              ListTile(
//                title: Text('Дни рождения'),
//                trailing: Icon(Icons.cake),
//                onTap: () {},
//              ),
              ListTile(
                title: Text('Премьеры'),
                trailing: Icon(Icons.theaters),
                onTap: () {},
              ),
              ListTile(
                title: Text('Информация о нас'),
                trailing: Icon(Icons.info),
                onTap: () {},
              ),
              ListTile(
                title: Text('Выйти'),
                trailing: Icon(Icons.exit_to_app),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          child: _fill.elementAt(sectionIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Главная')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Поиск')),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_special), title: Text('Библиотека')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Профиль')),
          ],
          currentIndex: sectionIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colorsys.black,
          unselectedItemColor: Colorsys.lightGrey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
