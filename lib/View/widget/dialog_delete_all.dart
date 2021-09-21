import 'package:flutter/material.dart';

class DialogDeleteAll extends StatefulWidget{
  @override
  _DialogDeleteAllState createState() => _DialogDeleteAllState();
}

class _DialogDeleteAllState extends State<DialogDeleteAll> {
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     title: const Text('AlertDialog Title'),
     content: const Text('AlertDialog description'),
     actions: <Widget>[
       TextButton(
         onPressed: () => Navigator.pop(context, 'Cancel'),
         child: const Text('Cancel'),
       ),
       TextButton(
         onPressed: () => Navigator.pop(context, 'OK'),
         child: const Text('OK'),
       ),
     ],
   );
  }
}