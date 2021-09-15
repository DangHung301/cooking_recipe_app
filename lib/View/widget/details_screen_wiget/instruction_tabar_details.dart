import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstructionTabarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return _itemStep(step: index, title: 'a', content: 'baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', size: size);
        });
  }
}

Widget _itemStep(
    {required int step,
    required String title,
    required String content,
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
                child: Icon(Icons.check_circle_rounded,
                    color: Colors.green),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step $step:',
                    style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 10),
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
              child: Text('$content', style: TextStyle(color: Colors.grey),),
            )),
      ],
    ),
  );
}
