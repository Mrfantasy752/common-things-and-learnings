// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:stack_board/stack_board.dart';

// class stackboard extends StatefulWidget {
//   const stackboard({Key? key}) : super(key: key);

//   @override
//   State<stackboard> createState() => _stackboardState();
// }

// class _stackboardState extends State<stackboard> {
//   final boardcontroller = StackBoardController();

//   @override
//   Widget build(BuildContext context) {
//       return SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: Column(
//      Scaffold(
//           children: [
//             StackBoard(
//               controller: boardcontroller,

//               ///添加背景
//               background: const ColoredBox(color: Colors.grey),
//               customBuilder: (StackBoardItem item) {
//                 boardcontroller.add(
//                   AdaptiveText(
//                     "data",
//                     tapToEdit: true,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//                 boardcontroller.add(StackBoardItem(
//                     child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.red,
//                 )));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
