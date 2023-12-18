// import 'package:flutter/material.dart';
// import 'package:snap_gpt/services/hex_converter.dart';
// //
// // class Dragme extends StatelessWidget {
// //   const Dragme({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         width: 377,
// //         height: 61,
// //         margin: EdgeInsets.all(53),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(30),
// //           color: convert_hex('#A5D1C6'),
// //         ),
// //         child: Row(
// //           children: [
// //             Draggable(
// //               childWhenDragging: Container(width: 55,height: 55,decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(50),color: Colors.white.withOpacity(0.5)
// //         ),child:Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,) ,),
// //               feedback: Container(width: 55,height: 55,decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(50),color: Colors.white
// //               ),child:Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
// //               child:
// //               Container(width: 55,height: 55,decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(50),color: Colors.white
// //               ),child:Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
// //             ),
// //
// //             SizedBox(width: 50,),
// //             const Text('Swipe left to get started' ,style: TextStyle(
// //
// //                 fontFamily: 'Lato',
// //                 fontWeight: FontWeight.w400,
// //                 fontSize: 18.0
// //             ),)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class Dragthe extends StatefulWidget {
// //   const Dragthe({super.key});
// //
// //   @override
// //   State<Dragthe> createState() => _DragtheState();
// // }
// //
// // class _DragtheState extends State<Dragthe> {
// //   Offset _dragPosition = Offset(0, 0);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
//
// class Weka extends StatefulWidget {
//   // const Weka({super.key});
//   AnimationController controller=AnimationController(duration:Duration(seconds: 5),vsync: );
//   CurvedAnimation animation=CurvedAnimation(parent: parent, curve: Curves.easeInCirc);
//   tween = Tween<double>(begin: -200, end: 0);
//   colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54);
//   AnimationController controller = AnimationController(
//   duration: const Duration(milliseconds: 500), vsync: this);
//   Animation<int> alpha = IntTween(begin: 0, end: 255).animate(controller);
//
//   @override
//   State<Weka> createState() => _WekaState();
// }
//
// class _WekaState extends State<Weka> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 377,
//         height: 61,
//         margin: EdgeInsets.all(53),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: convert_hex('#A5D1C6'),
//         ),
//         child: Row(
//           children: [
//             Draggable(
//               data: true,
//               axis: Axis.horizontal,
//               feedback: Container(width: 55,height: 55,decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),color: Colors.white
//         ),child:Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
//               child:
//               Container(width: 55,height: 55,decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),color: Colors.white
//               ),child:Icon(Icons.arrow_forward_ios_rounded,color: Colors.green,) ,),
//               onDraggableCanceled: (velocity,offset){
//                 print(velocity);
//                 print(offset);
//               },
//             ),
//
//
//             SizedBox(width: 50,),
//             const Text('Swipe left to get started' ,style: TextStyle(
//
//                 fontFamily: 'Lato',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 18.0
//             ),),
//             SizedBox(width: 30,),
//             DragTarget(
//                 onAccept: (bool status){
//                   print(status);
//                 },
//                 onLeave: (boo){
//
//
//                 },
//                 builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
//               return Container(width: 50,height: 50,color: Colors.red,);
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }
