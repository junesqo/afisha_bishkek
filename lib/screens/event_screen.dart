import 'package:bishkekevents/blocs/auth_bloc.dart';
import 'package:bishkekevents/blocs/product_bloc.dart';
import 'package:bishkekevents/main.dart';
import 'package:bishkekevents/models/product.dart';
import 'package:bishkekevents/services/firestore_service.dart';
import 'package:bishkekevents/styles/base.dart';
import 'package:bishkekevents/styles/colors.dart';
import 'package:bishkekevents/styles/text.dart';
import 'package:bishkekevents/widgets/button.dart';
import 'package:bishkekevents/widgets/dropdown_button.dart';
import 'package:bishkekevents/widgets/sliver_scaffold.dart';
import 'package:bishkekevents/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  final String productId;

  EventScreen({this.productId});

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  void initState() {
    var productBloc = Provider.of<ProductBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    return FutureBuilder<Product>(
      future: productBloc.fetchProduct(widget.productId),
      builder: (context, snapshot) {
        if (!snapshot.hasData && widget.productId != null) {
          return Scaffold(
            body: Center(
                child: (Platform.isIOS)
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator()),
          );
        }

        Product existingProduct;

        if (widget.productId != null) {
          //Edit Logic
          existingProduct = snapshot.data;
          loadValues(productBloc, existingProduct, authBloc.userId);
        } else {
          //Add Logic
          loadValues(productBloc, null, authBloc.userId);
        }

        return (Platform.isIOS)
            ? AppSliverScaffold.cupertinoSliverScaffold(
                navTitle: '',
                pageBody: pageBody(true, productBloc, context, existingProduct),
                context: context)
            : AppSliverScaffold.materialSliverScaffold(
                navTitle: '',
                pageBody:
                    pageBody(false, productBloc, context, existingProduct),
                context: context);
      },
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    var productBloc = Provider.of<ProductBloc>(context);
//    var authBloc = Provider.of<AuthBloc>(context);
//
//    return FutureBuilder<Product>(
//      future: productBloc.fetchProduct(widget.productId),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData && widget.productId != null) {
//          return Scaffold(
//            body: Center(
//                child: (Platform.isIOS)
//                    ? CupertinoActivityIndicator()
//                    : CircularProgressIndicator()),
//          );
//        }
//
//        Product existingProduct;
//
//        if (widget.productId != null) {
//          //Edit Logic
//          existingProduct = snapshot.data;
//          loadValues(productBloc, existingProduct, authBloc.userId);
//        } else {
//          //Add Logic
//          loadValues(productBloc, null, authBloc.userId);
//        }
//
//        return (Platform.isIOS)
//            ? AppSliverScaffold.cupertinoSliverScaffold(
//                navTitle: '',
//                pageBody: pageBody(true, productBloc, context, existingProduct),
//                context: context)
//            : AppSliverScaffold.materialSliverScaffold(
//                navTitle: '',
//                pageBody:
//                    pageBody(false, productBloc, context, existingProduct),
//                context: context);
//      },
//    );
//  }
//
Widget pageBody(bool isIOS, ProductBloc productBloc, BuildContext context,
    Product existingProduct) {
  var items = Provider.of<List<String>>(context);
  return ListView(
    children: <Widget>[
      StreamBuilder<String>(
          stream: productBloc.productName,
          builder: (context, snapshot) {
            return Text(
              '${productBloc.productName}',
              style: TextStyles.title,
              maxLines: 2,
            );
          }),
    ],
  );
}
//        Padding(
//          padding: BaseStyles.listPadding,
//          child: Divider(color: AppColors.primary),
//        ),
//        StreamBuilder<String>(
//            stream: productBloc.productName,
//            builder: (context, snapshot) {
//              return Text(
//                productName,
//                style: TextStyles.title,
//                maxLines: 2,
//              );
//            }),
////        StreamBuilder<String>(
////            stream: productBloc.unitType,
////            builder: (context, snapshot) {
////              return AppDropdownButton(
////                hintText: 'Unit Type',
////                items: items,
////                value: snapshot.data,
////                materialIcon: FontAwesomeIcons.balanceScale,
////                cupertinoIcon: FontAwesomeIcons.balanceScale,
////                onChanged: productBloc.changeUnitType,
////              );
////            }),
//        StreamBuilder<double>(
//            stream: productBloc.unitPrice,
//            builder: (context, snapshot) {
//              return AppTextField(
//                hintText: 'Unit Price',
//                cupertinoIcon: FontAwesomeIcons.tag,
//                materialIcon: FontAwesomeIcons.tag,
//                isIOS: isIOS,
//                textInputType: TextInputType.number,
//                errorText: snapshot.error,
//                initialText: (existingProduct != null)
//                    ? existingProduct.unitPrice.toString()
//                    : null,
//                onChanged: productBloc.changeUnitPrice,
//              );
//            }),
//        StreamBuilder<int>(
//            stream: productBloc.time,
//            builder: (context, snapshot) {
//              return AppTextField(
//                hintText: 'Available Units',
//                cupertinoIcon: FontAwesomeIcons.cubes,
//                materialIcon: FontAwesomeIcons.cubes,
//                isIOS: isIOS,
//                textInputType: TextInputType.number,
//                errorText: snapshot.error,
//                initialText: (existingProduct != null)
//                    ? existingProduct.time.toString()
//                    : null,
//                onChanged: productBloc.changeTime,
//              );
//            }),
//        StreamBuilder<int>(
//            stream: productBloc.availableUnits,
//            builder: (context, snapshot) {
//              return AppTextField(
//                hintText: 'Available Units',
//                cupertinoIcon: FontAwesomeIcons.cubes,
//                materialIcon: FontAwesomeIcons.cubes,
//                isIOS: isIOS,
//                textInputType: TextInputType.number,
//                errorText: snapshot.error,
//                initialText: (existingProduct != null)
//                    ? existingProduct.availableUnits.toString()
//                    : null,
//                onChanged: productBloc.changeAvailableUnits,

//      ],
//    );
//  }
//
loadValues(ProductBloc productBloc, Product product, String vendorId) {
  productBloc.changeProduct(product);
  productBloc.changeVendorId(vendorId);

  if (product != null) {
    //Edit
//      productBloc.changeUnitType(product.unitType);
    productBloc.changeProductName(product.productName);
    productBloc.changeUnitPrice(product.unitPrice.toString());
    productBloc.changeAvailableUnits(product.availableUnits.toString());
//      productBloc.changeTime(product.time.toString());
    productBloc.changeImageUrl(product.imageUrl ?? '');
  } else {
    //Add
//      productBloc.changeUnitType(null);
    productBloc.changeProductName(null);
    productBloc.changeUnitPrice(null);
    productBloc.changeAvailableUnits(null);
//      productBloc.changeTime(null);
    productBloc.changeImageUrl('');
  }
}
