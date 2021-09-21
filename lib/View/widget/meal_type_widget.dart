// import 'package:flutter/material.dart';
//
// class MealTypeWidget extends StatefulWidget{
//   @override
//   _MealTypeWidgetState createState() => _MealTypeWidgetState();
// }
//
// class _MealTypeWidgetState extends State<MealTypeWidget> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Meal Type',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w900),
//             ),
//           ),
//           Wrap(
//             spacing: 12,
//             direction: Axis.horizontal,
//             children: List<Widget>.generate(7, (int index) {
//               return FilterChip(
//                 label: Text(
//                   filterMeal[index].label,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w300,
//                     color: widget.recipeViewModel.curMeal == index
//                         ? const Color(0xff651fff)
//                         : Colors.black,
//                   ),
//                 ),
//                 selected: widget.recipeViewModel.curMeal == index,
//                 backgroundColor: const Color(0xffe3e3e3),
//                 selectedColor: const Color(0xffE8DDFF),
//                 showCheckmark: true,
//                 checkmarkColor: const Color(0xff651fff),
//                 onSelected: (selected) {
//                   setState(() {
//                     widget.recipeViewModel.curMeal = index;
//                     widget.recipeViewModel.map['meal'] =
//                         widget.recipeViewModel.mealTypes[index].label;
//                   });
//                 },
//               );
//             }),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           const Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Diet Type',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w900),
//             ),
//           ),
//           Wrap(
//             spacing: 6,
//             direction: Axis.horizontal,
//             children: List<Widget>.generate(7, (int index) {
//               return FilterChip(
//                 label: Text(
//                   filterDiet[index].label,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w300,
//                     color: widget.recipeViewModel.curDiet == index
//                         ? const Color(0xff651fff)
//                         : Colors.black,
//                   ),
//                 ),
//                 selected: widget.recipeViewModel.curDiet == index,
//                 backgroundColor: const Color(0xffe3e3e3),
//                 selectedColor: const Color(0xffE8DDFF),
//                 showCheckmark: true,
//                 checkmarkColor: const Color(0xff651fff),
//                 onSelected: (selected) {
//                   setState(() {
//                     widget.recipeViewModel.curDiet = index;
//                     widget.recipeViewModel.map['diet'] =
//                         widget.recipeViewModel.dietTypes[index].label;
//                   });
//                 },
//               );
//             }),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   widget.recipeViewModel.searchFilter(widget.recipeViewModel.map);
//                   Navigator.pop(context);
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: AppColor.primaryColor,
//                 minimumSize: const Size(380, 55),
//               ),
//               child: const Text(
//                 'APPLY',
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w900),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }