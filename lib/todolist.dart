import 'package:flutter/material.dart';

// class ToDoList extends StatelessWidget {
//   const ToDoList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//       ),
//     );
//   }
// }

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('ToDoList'),
        onPressed: () {
          Navigator.pop(ctx);
        },
      )),
    );
  }
}
