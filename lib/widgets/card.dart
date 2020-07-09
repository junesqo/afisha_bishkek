import 'package:bishkekevents/styles/base.dart';
import 'package:bishkekevents/styles/colors.dart';
import 'package:bishkekevents/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final String productName;
  final String unitType;
  final int availableUnits;
  final double price;
  final String note;

  final formatCurrency = NumberFormat.simpleCurrency();

  AppCard({
    @required this.productName,
    @required this.unitType,
    @required this.availableUnits,
    @required this.price,
    this.note = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 220.0,
      margin: EdgeInsets.only(left: 24),
//      padding: BaseStyles.listPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
            child: Image.asset(
              'assets/1.jpg',
              height: 131.0,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(productName, style: TextStyles.eventtitle),
                  Text('${formatCurrency.format(price)}/$unitType',
                      style: TextStyles.eventnumtext),
                  (availableUnits > 0)
                      ? Text('In Stock', style: TextStyles.bodyLightBlue)
                      : Text('Currently Unavailable', style: TextStyles.bodyRed)
                ],
              ),
            ),
          ),
//          Text(note, style: TextStyles.body)
        ],
      ),
    );
  }
}

//import 'package:bishkekevents/styles/base.dart';
//import 'package:bishkekevents/styles/colors.dart';
//import 'package:bishkekevents/styles/text.dart';
//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//
//class AppCard extends StatelessWidget {
//  final String productName;
////  final String unitType;
//  final int availableUnits;
//  final double price;
//  final String note;
////  final int time;
////  final String vendorId;
//
//  final formatCurrency = NumberFormat.simpleCurrency();
//
//  AppCard({
//    @required this.productName,
////    @required this.unitType,
//    @required this.availableUnits,
//    @required this.price,
////    @required this.time,
////    this.vendorId,
//    this.note = "",
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        margin: BaseStyles.listPadding,
//        padding: BaseStyles.listPadding,
//        decoration: BoxDecoration(
//            boxShadow: BaseStyles.boxShadow,
//            color: Colors.white,
////          border: Border.all(
////            color: AppColors.primary,
////            width: BaseStyles.borderWidth,
////          ),
//            borderRadius: BorderRadius.circular(BaseStyles.borderRadius)),
//        child: Container(
//          height: 219.0,
//          width: 250.0,
//          child: Column(
//            children: <Widget>[
//              ClipRRect(
////              borderRadius: BorderRadius.only(
////                  topLeft: Radius.circular(16.0),
////                  topRight: Radius.circular(16.0),
////                  bottomRight: Radius.zero,
////                  bottomLeft: Radius.zero),
//                child: Image(
//                  image: AssetImage("assets/1.jpg"),
//                  width: 250.0,
//                  height: 131.0,
//                  fit: BoxFit.cover,
//                ),
////                            ),
//              ),
//              Container(
//                height: 88.0,
//                width: 250.0,
//                padding: EdgeInsets.symmetric(horizontal: 8.0),
//                decoration: BoxDecoration(
//                  color: Colors.white,
////                  boxShadow: [
////                    BoxShadow(
////                      color: Colors.grey.withOpacity(0.2),
////                      spreadRadius: 0,
////                      blurRadius: 10,
////                      offset: Offset(
////                          0, 0.2), // changes position of shadow
////                    ),
////                  ],
////                  borderRadius: BorderRadius.only(
////                    bottomLeft: Radius.circular(16.0),
////                    bottomRight: Radius.circular(16.0),
////                  )
//                ),
//                child: Row(children: <Widget>[
//                  Container(
////                                  height: 40.0,
//                    width: 28.0,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        SizedBox(height: 16.0),
//                        Text(
//                          "21",
//                          style: TextStyle(
//                              fontSize: 17.0,
//                              fontWeight: FontWeight.bold,
////                                            fontFamily: 'Jost',
//                              color: Theme.of(context).primaryColor),
//                        ),
//                        Text(
//                          "ФЕВ",
//                          style: TextStyle(
//                            fontSize: 10.0,
//                            fontWeight: FontWeight.w800,
//                            color: Colors.black,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  SizedBox(width: 8.0),
//                  Container(
//                    height: 72.0,
//                    width: 198.0,
//                    child: Column(
//                      children: <Widget>[
//                        Flexible(
//                          child: Container(
////                                      height: 64.0,
////                                        width: 206.0,
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                SizedBox(height: 2.0),
//                                Text(
//                                  productName,
//                                  style: TextStyles.subtitle,
//                                  maxLines: 2,
//                                ),
//                                Row(
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    Column(
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text(price.toString(),
//                                              style: TextStyles.eventnumtext),
//                                        ]),
//                                    Text(
//                                      availableUnits.toString(),
//                                      style: TextStyles.subtitle,
//                                    ),
//                                  ],
//                                ),
//                                Icon(Icons.favorite_border, size: 24.0)
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ]),
//              ),
//            ],
//          ),
//        ));
//  }
//}
//
