import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share/share.dart';

class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.of(context)?.food_joke ?? ''),
          actions: [
            IconButton(onPressed: () {
              Share.share('Hello');
            }, icon: Icon(Icons.share)),
          ],
        ),
        body: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('$images/splash_screen.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('$images/card.png'))),
            ),
          ),
        ));
  }
}
