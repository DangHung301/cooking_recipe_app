// import 'package:cooking_recipe_app/Helper/constan/assets.dart';
// import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
// import 'package:flutter/material.dart';
//
// class SearchWidget extends SearchDelegate {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [IconButton(onPressed: () {}, icon: Icon(Icons.mic_rounded))];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: Icon(Icons.arrow_back));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//         child: Center(
//       child: Text('ascascas'),
//     ));
//   }
//
//   List<String> recentList = ['Text 4', 'Text 3'];
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) => RecipesItem(
//             vegan: true,
//             aggregateLikes: 22,
//             id: 2,
//             title: 'ascasc',
//             readyInMinutes: 22,
//             image: '',
//             summary: 'asgvassad'));
//   }
// }
