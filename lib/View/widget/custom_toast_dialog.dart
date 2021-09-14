import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget ToastDialog(Size size, String content, String textButtom, FToast fToast) {
  return Container(
    width: size.width,
    height: size.width * 0.13,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: bgrToastDialog),
    child: Row(
      children: [
        Expanded(flex: 7, child: Text('$content', style: TextStyle(color: Colors.white) ,)),
        Expanded(
          flex: 3,
          child: InkWell(
            child: Text('$textButtom', style: TextStyle(color: bgrFoatingButton), textDirection: TextDirection.rtl),
            onTap: () {
              fToast.removeCustomToast();
            },
          ),
        )
      ],
    ),
  );
}
