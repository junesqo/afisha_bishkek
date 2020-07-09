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
