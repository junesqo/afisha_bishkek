class Task {
  String _taskname;
  String _taskdetails;
  String _taskdate;
  String _tasktime;
  String _tasktype;

  Task(this._taskname, this._taskdetails, this._taskdate, this._tasktime,
      this._tasktype);

  Task.map(dynamic obj) {
    this._taskname = obj['taskname'];
    this._taskdetails = obj['taskdetails'];
    this._taskdate = obj['taskdate'];
    this._tasktime = obj['tasktime'];
    this._tasktype = obj['tasktype'];
  }

  String get taskname => _taskname;
  String get taskdetails => _taskdetails;
  String get taskdate => _taskdate;
  String get tasktime => _tasktime;
  String get tasktype => _tasktype;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['taskname'] = _taskname;
    map['taskdetails'] = _taskdetails;
    map['taskdate'] = _taskdate;
    map['tasktime'] = _tasktime;
    map['tasktype'] = _tasktype;
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    this._taskname = map['taskname'];
    this._taskdetails = map['taskdetails'];
    this._taskdate = map['taskdate'];
    this._tasktime = map['tasktime'];
    this._tasktype = map['tasktype'];
  }
}

class EventModel {
  final String name;
  final String organization;
  final String date;
  final String month;
  final String guests;
  final String time;
  final String imgPath;
  final String kmAway;
  final String address;
  final String description;

  EventModel({
    this.name,
    this.organization,
    this.date,
    this.month,
    this.guests,
    this.time,
    this.imgPath,
    this.kmAway,
    this.address,
    this.description,
  });

  static List<EventModel> list = [
    EventModel(
        name: 'Мероприятие фестиваль в честь бутылки воды',
        organization: 'Бутылка воды КОРОНА',
        date: '25',
        month: 'МАЙ',
        guests: '6 друзей интересуются',
        time: '15:00 - 18:00',
        kmAway: '100m',
        address: 'ул. Киевская - Советская 99',
        description:
            'Для современного мира существующая теория предоставляет широкие возможности для кластеризации усилий. Прежде всего, высокотехнологичная концепция общественного уклада играет важную роль в формировании благоприятных перспектив.',
        imgPath: '1.jpg'),
    EventModel(
//      imageUrl: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
        name: 'Забег марафон в честь погибших от коронавируса',
        organization: 'Марафонцы',
        date: '3',
        month: 'СЕН',
        guests: '7 друзей интересуются',
        time: '15:00 - 18:00',
        kmAway: '2200',
        address: 'ул. Киевская - Советская 99',
        description:
            'Для современного мира существующая теория предоставляет широкие возможности для кластеризации усилий. Прежде всего, высокотехнологичная концепция общественного уклада играет важную роль в формировании благоприятных перспектив.',
        imgPath: '2.jpg'),
    EventModel(
//      imageUrl: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
        name: 'Митинг революция против расизма',
        organization: 'Америка',
        date: '16',
        month: 'АВГ',
        guests: '8 друзей интересуются',
        time: '15:00 - 18:00',
        kmAway: '8300m',
        address: 'ул. Киевская - Советская 99',
        description:
            'Для современного мира существующая теория предоставляет широкие возможности для кластеризации усилий. Прежде всего, высокотехнологичная концепция общественного уклада играет важную роль в формировании благоприятных перспектив.',
        imgPath: '3.jpg'),
    EventModel(
//      imageUrl: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
        name: 'Митап разработчиков приложения для афишы мероприятий',
        organization: 'Nesqo',
        date: '8',
        month: 'СЕН',
        guests: '5 друзей интересуются',
        time: '15:00 - 18:00',
        kmAway: '1800m',
        address: 'ул. Киевская - Советская 99',
        description:
            'Для современного мира существующая теория предоставляет широкие возможности для кластеризации усилий. Прежде всего, высокотехнологичная концепция общественного уклада играет важную роль в формировании благоприятных перспектив.',
        imgPath: '4.jpg'),
  ];
}
