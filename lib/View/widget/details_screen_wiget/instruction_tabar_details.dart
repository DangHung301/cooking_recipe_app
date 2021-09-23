import 'package:cooking_recipe_app/Model/instruction.dart';
import 'package:cooking_recipe_app/ViewModel/instructions_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructionTabarDetails extends StatefulWidget {
  final int id;
  final InstructionViewmodel instructionViewmodel;

  InstructionTabarDetails(
      {required this.id, required this.instructionViewmodel});

  @override
  _InstructionTabarDetailsState createState() =>
      _InstructionTabarDetailsState();
}

class _InstructionTabarDetailsState extends State<InstructionTabarDetails> {
  @override
  void initState() {
    super.initState();
    widget.instructionViewmodel.getDataInstruction(widget.id);

  }

  @override
  void dispose() {
    super.dispose();
    widget.instructionViewmodel.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: widget.instructionViewmodel.subject.stream,
        builder: (context, AsyncSnapshot<List<Instructions>> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.hasError.toString()}');
          }

          final datas = snapshot.data ?? [];

          return datas.isNotEmpty
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return _itemStep(
                        step: snapshot.data?[index].number,
                        title: '',
                        content: snapshot.data?[index].step,
                        size: size);
                  })
              : Center(
                  child: Text('Empty'),
                );
        });
  }
}

Widget _itemStep(
    {required int? step,
    required String title,
    required String? content,
    required Size size}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    width: size.width,
    height: size.height * 0.2,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: Row(children: [
              Container(
                width: size.width * 0.2,
                child: Icon(Icons.check_circle_rounded, color: Colors.green),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step $step:',
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.7), fontSize: 10),
                  ),
                  Text(
                    '$title',
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  )
                ],
              )
            ])),
        Expanded(
            flex: 6,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.vertical,
              child: Text(
                '$content',
                style: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    ),
  );
}
