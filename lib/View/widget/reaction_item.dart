import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReactionItem extends StatelessWidget {
  int? aggregateLikes = 0;
  int? readyInMinutes = 0;
  bool vegan = false;


  ReactionItem({required this.aggregateLikes, required this.readyInMinutes, required this.vegan});

  Color textColorVegan(bool vegan) {
    return vegan ? textColorVeganOn : textColorVeganOff;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      subReaction(
          icon: '$icons/favorite.svg',
          number: aggregateLikes,
          textColor: textColorFavorite),

      SizedBox(width: 10,),

      subReaction(
          icon: '$icons/schedule.svg',
          number: readyInMinutes,
          textColor: textColorSchedule),

      SizedBox(width: 10,),

      Column(children: [
        vegan
            ? Image.asset(
                '$icons/eco_on.png',
                height: 20,
                width: 20,
              )
            : Image.asset(
                '$icons/eco_off.png',
                height: 20,
                width: 20,
              ),
        Text(
          'Vegan',
          style: TextStyle(color: textColorVegan(vegan), fontSize: 10),
        )
      ]),
    ]);
  }
}

Widget subReaction({String? icon, int? number, Color? textColor}) {
  return Column(
    children: [
      SvgPicture.asset(
        '$icon',
      height: 20, width: 20,),
      Text(
        '$number',
        style: TextStyle(color: textColor, fontSize: 10),
      )
    ],
  );
}