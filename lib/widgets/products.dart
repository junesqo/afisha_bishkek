import 'package:bishkekevents/blocs/auth_bloc.dart';
import 'package:bishkekevents/blocs/product_bloc.dart';
import 'package:bishkekevents/models/product.dart';
import 'package:bishkekevents/styles/colors.dart';
import 'package:bishkekevents/widgets/minicard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

import 'card.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    return pageBody(productBloc, context, authBloc.userId);
  }

  Widget pageBody(
      ProductBloc productBloc, BuildContext context, String vendorId) {
    return StreamBuilder<List<Product>>(
        stream: productBloc.productByVendorId(vendorId),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return (Platform.isIOS)
                ? SizedBox(height: 20, child: CupertinoActivityIndicator())
                : SizedBox(height: 20, child: CircularProgressIndicator());

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var product = snapshot.data[index];
                      return GestureDetector(
                        child: AppCard(
                          availableUnits: product.availableUnits,
                          price: product.unitPrice,
                          productName: product.productName,
//                          unitType: product.unitType,
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed('/eventdetails/${product.productId}'),
                      );
                    }),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var product = snapshot.data[index];
                      return GestureDetector(
                        child: MiniCard(
                          availableUnits: product.availableUnits,
                          price: product.unitPrice,
                          productName: product.productName,
//                          unitType: product.unitType,
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed('/eventdetails/${product.productId}'),
                      );
                    }),
              ),
              GestureDetector(
                child: Container(
                  height: 50.0,
                  width: 250,
                  color: AppColors.primary,
                  child: (Platform.isIOS)
                      ? Icon(CupertinoIcons.add,
                          color: Colors.white, size: 35.0)
                      : Icon(Icons.add, color: Colors.white, size: 35.0),
                ),
                onTap: () => Navigator.of(context).pushNamed('/editproduct'),
              )
            ],
          );
        });
  }
}
