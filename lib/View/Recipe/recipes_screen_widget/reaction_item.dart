import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReactionItem extends StatelessWidget {
  final int aggregateLikes;
  final int readyInMinutes;
  final bool vegan;

  ReactionItem(
      {required this.aggregateLikes,
      required this.readyInMinutes,
      required this.vegan});

  Color textColorVegan(bool vegan) {
    return vegan ? textColorVeganOn : textColorVeganOff;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      subReaction(
          icon: '$icons/favorite.svg',
          number: aggregateLikes,
          textColor: textColorFavorite, context: context),
      SizedBox(
        width: 10,
      ),
      subReaction(
          icon: '$icons/schedule.svg',
          number: readyInMinutes,
          textColor: textColorSchedule, context: context),
      SizedBox(
        width: 10,
      ),
      Column(children: [
        vegan
            ? Image.asset(
                '$icons/eco_on.png',
                height: 24,
                width: 24,
              )
            : Image.asset(
                '$icons/eco_off.png',
                height: 24,
                width: 24,
              ),
        Text(
          'Vegan',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 10, color: textColorVegan(vegan)),
        )
      ]),
    ]);
  }
}

Widget subReaction({String? icon, int? number, Color? textColor, required BuildContext context}) {
  return Column(
    children: [
      SvgPicture.asset(
        '$icon',
      ),
      Text(
        '$number',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 10, color: textColor),
      )
    ],
  );
}