import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:flutter/material.dart';

class IngredientsTabarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _itemIngredients(
              image: '$images/img.png',
              name: 'asca',
              amount: 'abc',
              size: size);
        });
  }
}

Widget _itemIngredients(
    {required String image,
    required String name,
    required String amount,
    required Size size}) {
  return Container(
    width: size.width,
    height: size.height * 0.1,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Container(
          width: size.width * 0.3,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('$image'), fit: BoxFit.cover),
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
          ),
        ),

        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text(
              'nasocnasm',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'nasocnasm',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        )
      ],
    ),
  );
}
