import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm(this.emailTextController, this.passwordTextController,
      this.nameTextController, this.parentAction, this.isWithSNS);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController nameTextController;

  final ValueChanged<List<dynamic>> parentAction;

  bool isWithSNS = false;

  @override
  State<StatefulWidget> createState() => _SignUpForm();
}

enum GenderEnum { man, woman }

class _SignUpForm extends State<SignUpForm>
    with AutomaticKeepAliveClientMixin<SignUpForm> {
  // init data
  GenderEnum _userGender = GenderEnum.man;
  String _selectDateString = 'Дата рождения';
  bool _agreedToTerm = false;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 18, DateTime.now().month),
        firstDate: DateTime(
            DateTime.now().year - 70, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(DateTime.now().year - 13, DateTime.now().month,
            DateTime.now().day));
    if (picked != null && picked != DateTime.now())
      setState(() {
        _selectDateString = "${picked.toLocal()}".split(' ')[0];
        _passDataToParent('birth_year', picked.year);
        _passDataToParent('birth_month', picked.month);
        _passDataToParent('birth_day', picked.day);
      });

    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _setAgreedToTerm(bool newValue) {
    _passDataToParent('term', newValue);
    setState(() {
      _agreedToTerm = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(14.0, 0, 14, 10),
      padding: const EdgeInsets.fromLTRB(14.0, 0, 14, 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextFormField(
              enabled: !widget.isWithSNS,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.mail,
                    color: !widget.isWithSNS ? Colors.grey : Colors.grey[300],
                  ),
                  labelText: 'Email',
                  hintText: 'Введите Email'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Email is required';
                } else {
                  return null;
                }
              },
              style: TextStyle(
                  color: !widget.isWithSNS ? Colors.black : Colors.grey[400]),
              controller: widget.emailTextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextFormField(
              enabled: !widget.isWithSNS,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock,
                    color: !widget.isWithSNS ? Colors.grey : Colors.grey[300],
                  ),
                  labelText: !widget.isWithSNS ? 'Пароль' : 'Пароль не нужен',
                  hintText: 'Введите пароль'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Password is required';
                } else {
                  return null;
                }
              },
              style: TextStyle(
                  color: !widget.isWithSNS ? Colors.black : Colors.grey[300]),
              controller: widget.passwordTextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.account_circle),
                  labelText: 'Имя',
                  hintText: 'Введите имя'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Name is required';
                } else {
                  return null;
                }
              },
              controller: widget.nameTextController,
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Icon(
                Icons.wc,
                color: Colors.grey,
              ),
              Radio(
                value: GenderEnum.man,
                groupValue: _userGender,
                onChanged: (GenderEnum value) {
                  setState(() {
                    _passDataToParent('gender', 'Man');
                    _userGender = value;
                  });
                },
              ),
              new GestureDetector(
                onTap: () {
                  setState(() {
                    _passDataToParent('gender', 'Man');
                    _userGender = GenderEnum.man;
                  });
                },
                child: Text('Мужчина'),
              ),
              SizedBox(
                width: 20,
              ),
              Radio(
                value: GenderEnum.woman,
                groupValue: _userGender,
                onChanged: (GenderEnum value) {
                  setState(() {
                    _passDataToParent('gender', 'Woman');
                    _userGender = value;
                  });
                },
              ),
              new GestureDetector(
                onTap: () {
                  setState(() {
                    _passDataToParent('gender', 'Woman');
                    _userGender = GenderEnum.woman;
                  });
                },
                child: Text('Женщина'),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.cake,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Container(
                    width: 240,
                    child: RaisedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(_selectDateString),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _agreedToTerm,
                    onChanged: _setAgreedToTerm,
                  ),
                  GestureDetector(
                    onTap: () {
                      _agreedToTerm = !_agreedToTerm;
                      _setAgreedToTerm(_agreedToTerm);
                    },
                    child: Text('Я согласен с '),
                  ),
                  GestureDetector(
                    onTap: () => _showTermPolicy(),
                    child: const Text(
                      'Условиями использов...',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTermPolicy() {
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("SignInExample's Terms of Services, Privacy Policy"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            height: 360,
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Terms of Services, Privacy Policy' * 100),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            )
          ],
        ));
  }

  void _passDataToParent(String key, dynamic value) {
    List<dynamic> addData = List<dynamic>();
    addData.add(key);
    addData.add(value);
    widget.parentAction(addData);
  }

  @override
  bool get wantKeepAlive => true;
}
