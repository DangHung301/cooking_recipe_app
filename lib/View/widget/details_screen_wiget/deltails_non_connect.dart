import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/View/widget/custom_toast_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeltailsNonConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fToast = FToast();
    fToast.init(context);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.3,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('$images/no_internet_connection.png'),
                  )),
        ),

      ],
    ));
  }
}
