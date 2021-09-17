import 'package:cooking_recipe_app/Model/instruction.dart';
import 'package:cooking_recipe_app/Service/fetch_data_instruction.dart';
import 'package:rxdart/rxdart.dart';

class InstructionViewmodel{
  BehaviorSubject<List<Instructions>> _subject = BehaviorSubject<List<Instructions>>();

  List<Instructions> listInstruction = [];

  getDataInstruction(int id) async{
    this.listInstruction = await FetchDataInstruction.fetchDataInstruction(id);
    _subject.sink.add(this.listInstruction);
  }

  BehaviorSubject<List<Instructions>> get subject => _subject;

  void dispose(){
    _subject.close();
  }
}