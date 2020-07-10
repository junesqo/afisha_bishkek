import 'package:bishkekevents/styles/base.dart';
import 'package:bishkekevents/styles/colors.dart';
import 'package:bishkekevents/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MiniCard extends StatelessWidget {
  final String productName;
  final String unitType;
  final int availableUnits;
  final double price;
  final String note;

  final formatCurrency = NumberFormat.simpleCurrency();

  MiniCard({
    @required this.productName,
    @required this.unitType,
    @required this.availableUnits,
    @required this.price,
    this.note = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      height: 88.0,
      margin: EdgeInsets.only(left: 24),
//      padding: BaseStyles.listPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(BaseStyles.borderRadius),
              bottomLeft: Radius.circular(BaseStyles.borderRadius),
            ),
            child: Image.asset(
              'assets/1.jpg',
              height: 88.0,
              width: 88,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(productName, style: TextStyles.eventtitle),
                  Text('${formatCurrency.format(price)}/$unitType',
                      style: TextStyles.eventnumtext),
                  (availableUnits > 0)
                      ? Text('In Stock', style: TextStyles.bodyPrimary)
                      : Text('Currently Unavailable', style: TextStyles.bodyRed)
                ],
              ),
            ),
          )
//          Text(note, style: TextStyles.body)
        ],
      ),
    );
  }
}
