import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/app_icons.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/model/list_model.dart';
import 'package:todo_app/view/widgets/dropdown_button.dart';

// class ShowBottomSheet extends StatelessWidget {
//   const ShowBottomSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text(
//             "Press the botton",
//           ),
//           onPressed: () {
//             // showbottom(context);
//           },
//         ),
//       ),
//     );
//   }

showbottom(BuildContext context) {
  String dropdownValue = 'Apple';

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height / 25,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(175, 30),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 415,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.ellipseColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(getW(50.0)),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: getH(5.0),
                          spreadRadius: getW(3.0),
                          offset: const Offset(0.0, 3.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/x.svg",
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Text(
                      'Add new task',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextFormField(
                        autofocus: true,
                        style: const TextStyle(
                            fontSize: 22, fontStyle: FontStyle.normal),
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Type here! "),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 60,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: getW(15.0)),
                            child: SizedBox(
                              width: getW(70.0),
                              height: getH(45.0),
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, right: 4.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Listofcontexts.colorOFcircle[index],
                                        radius: 5.0,
                                      ),
                                    ),
                                  ),
                                  Text(Listofcontexts.nameOfprojects[index])
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: getH(43.0)),
                    const DropDownButton()
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
