import 'package:cooking_recipe_app/Helper/extension.dart';

class Instructions {
  int? number;
  String? step;

  Instructions({required this.number, required this.step});

  factory Instructions.fromJson(Map<String, dynamic> json) {
    return Instructions(number: json.intValue('number'), step: json.stringValue('step'));
  }
}
