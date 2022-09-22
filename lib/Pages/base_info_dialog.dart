// import 'package:flutter/material.dart';
//
// class BaseInfoDialog extends Dialog {
//   final String title;
//   final String? confirm;
//   final String? cancel;
//   final String? content;
//   final String? cancelColor;
//   final String? confirmColor;
//   final bool? showCancel;
//   final OnDialogClickListener? clickListener;
//
//   const BaseInfoDialog(
//       {this.cancelColor = '#00000',
//         this.confirmColor = '#576B95',
//         this.title = '标题',
//         this.cancel = '取消',
//         this.confirm = '确定',
//         this.content = '',
//         this.showCancel = true,
//         this.clickListener,
//         Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         constraints: const BoxConstraints(maxHeight: 600),
//         width: double.infinity,
//         margin: const EdgeInsets.all(30),
//         decoration: const ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 12, bottom: 14),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//             ),
//             Offstage(
//               offstage: content!.isEmpty,
//               child: Container(
//                 margin: const EdgeInsets.only(bottom: 17),
//                 child: Text(
//                   content!,
//                   style:
//                   TextStyle(fontSize: 17, color: Colors.lightBlue),
//                 ),
//               ),
//             ),
//             Container(
//               height: 0.7,
//               color: Colors.green,
//             ),
//             getBottomWidget(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   getBottomWidget(context) {
//     if (showCancel!) {
//       return SizedBox(
//         height: 43,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: InkWell(
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     cancel!,
//                     style: const TextStyle(
//                         fontSize: 17,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 onTap: () => {
//                   clickListener?.onCancel(),
//                   Navigator.of(context).pop(),
//                 },
//               ),
//             ),
//             Container(
//               height: 43,
//               width: 0.7,
//               color: Colors.red,
//             ),
//             Expanded(
//               child: InkWell(
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     confirm!,
//                     style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.yellow,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 onTap: () => {clickListener?.onConfirm(), Navigator.of(context).pop()},
//               ),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return InkWell(
//         child: Container(
//           height: 43,
//           alignment: Alignment.center,
//           child: Text(
//             confirm!,
//             style: TextStyle(
//                 fontSize: 17,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         onTap: () => {
//           clickListener?.onConfirm(),
//           Navigator.of(context).pop(),
//         },
//       );
//     }
//   }
// }
//
// abstract class OnDialogClickListener {
//   void onConfirm();
//   void onCancel();
// }

import 'package:flutter/material.dart';

class MyDialog extends Dialog {

  String title;
  String content;
  MyDialog({this.title = '', this.content = ''});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
            child: Container(
                height: 300,
                width: 300,
                color: Colors.white,
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.center, child: Text(this.title)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Icon(Icons.close),
                              onTap: ()=> { Navigator.pop(context) },
                            ),
                          )
                        ],
                      )),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Text('${this.content}', textAlign: TextAlign.left,),
                  ),
                ]))));
  }
}
