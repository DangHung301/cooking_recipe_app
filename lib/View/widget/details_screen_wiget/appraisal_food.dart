import 'package:flutter/material.dart';

class AppraisalFood extends StatelessWidget {
  final int aggregateLikes;
  final int readyInMinutes;
  final String title;
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final bool veryHealthy;
  final bool cheap;

  AppraisalFood({
    required this.aggregateLikes,
    required this.readyInMinutes,
    required this.title,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text(
            '$title',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),

         SizedBox(height: 15,),

         Row(
           children: [
             Container(
               width: size.width * 0.3,
               child: Column(
                 children: [
                   _subAppraisal(title: 'vegan', status: vegan),
                   SizedBox(height: 10,),
                   _subAppraisal(title: 'Vegetarian', status: vegetarian),
                 ],
               ),
             ),
             Container(
               width: size.width * 0.3,
               child: Column(
                 children: [
                   _subAppraisal(title: 'Dairy Free', status: dairyFree),
                   SizedBox(height: 10,),
                   _subAppraisal(title: 'Gluten Free', status: glutenFree),
                 ],
               ),
             ),
             Container(
               width: size.width * 0.3,
               child: Column(
                 children: [
                   _subAppraisal(title: 'Healthy', status: veryHealthy),
                   SizedBox(height: 10,),
                   _subAppraisal(title: 'Cheap', status: cheap),
                 ],
               ),
             ),
           ],
         )

        ],
      ),
    );
  }
}
Widget _subAppraisal({required String title, required bool status}) {
  return Row(
    children: [
      status
          ? Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
            )
          : Icon(Icons.check_circle_rounded, color: Colors.grey,),
      SizedBox(
        width: 2,
      ),
      status
          ? Text(
              '$title',
              style: TextStyle(color: Colors.green),
            )
          : Text(
              '$title',
              style: TextStyle(color: Colors.grey),
            )
    ],
  );
}
