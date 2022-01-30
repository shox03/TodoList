// import 'package:flutter/material.dart';
// import 'package:todo_app/core/components/size_config.dart';

// class AddButtonWidget extends StatelessWidget {
//   const AddButtonWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       margin: EdgeInsets.only(
//         top: getH(52),
//       ),
//       height: getH(53),
//       width: getW(333),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(getW(10)),
//         gradient: const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [
//             Color(0xff7EB6FF),
//             Color(0xff5F87E7),
//           ],
//         ),
//       ),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           fixedSize: Size(getW(258), getW(58)),
//           primary: Colors.transparent,
//           elevation: 0,
//         ),
//         onPressed: () {
//           // Save new item
//           if (itemKey == null) {
//             _createItem({
//               "name": _nameController.text,
//               "quantity": _quantityController.text
//             });
//           }

//           // update an existing item
//           if (itemKey != null) {
//             _updateItem(itemKey, {
//               'name': _nameController.text.trim(),
//               'quantity': _quantityController.text.trim()
//             });
//           }

//           // Clear the text fields
//           _nameController.text = '';
//           _quantityController.text = '';

//           Navigator.of(context).pop();
//         },
//         child: const Text(
//           "Add task",
//         ),
//       ),
//     );
//   }
// }
