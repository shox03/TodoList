import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/components/size_config.dart';
import 'package:todo_app/core/constants/app_icons.dart';
import 'package:todo_app/core/constants/main_colors.dart';
import 'package:todo_app/model/list_model.dart';
import 'package:todo_app/view/widgets/colored_text_button.dart';
import 'package:todo_app/view/widgets/dropdown_button.dart';

class BottomSheetButton extends StatefulWidget {
  const BottomSheetButton({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  List<Map<String, dynamic>> items = [];

  final tasksBox = Hive.box('task_box');

  @override
  void initState() {
    super.initState();
    refreshItems(); // Load data when app starts
  }

  // Get all items from the database
  void refreshItems() {
    final data = tasksBox.keys.map((key) {
      final value = tasksBox.get(key);
      return {"key": key, "task": value["task"], "text": value["text"]};
    }).toList();

    setState(() {
      items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  // Create new item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await tasksBox.add(newItem);

    refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key
  // Our app won't use this function but I put it here for your reference
  Map<String, dynamic> _readItem(int key) {
    final item = tasksBox.get(key);
    return item;
  }

  // Update a single item
  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await tasksBox.put(itemKey, item);
    refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey) async {
    await tasksBox.delete(itemKey);
    refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  // TextFields' controllers
  final TextEditingController _taskController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.ellipseColor,
      onPressed: () {
        showForm(context, null);
      },
      child: SvgPicture.asset(APPIcons.plus),
    );
  }

  void showForm(
    BuildContext ctx,
    int? itemKey,
  ) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
          items.firstWhere((element) => element['key'] == itemKey);
      _taskController.text = existingItem['task'];
    }
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (
        BuildContext context,
      ) {
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
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _taskController,
                          autofocus: false,
                          style: const TextStyle(
                              fontSize: 22, fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type here! "),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 60,
                        padding: const EdgeInsets.symmetric(vertical: 9),
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
                                width:
                                    getW(index == 0 || index == 3 ? 100 : 90),
                                height: getH(50.0),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Listofcontexts.colorOFcircle[index],
                                        radius: 5.0,
                                      ),
                                    ),
                                    ColoredButton(index: index)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: getH(40.0)),
                      const DropDownButton(),
                      SizedBox(height: getH(30.0)),
                      Container(
                        margin: EdgeInsets.only(
                          top: getH(52),
                        ),
                        height: getH(53),
                        width: getW(333),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getW(10)),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff7EB6FF),
                              Color(0xff5F87E7),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(getW(258), getW(58)),
                            primary: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            // Save new item
                            if (itemKey == null) {
                              _createItem({
                                "task": _taskController.text,
                              });
                            }

                            // update an existing item
                            if (itemKey != null) {
                              _updateItem(itemKey, {
                                'task': _taskController.text.trim(),
                              });
                            }

                            // Clear the text fields
                            _taskController.text = '';

                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Add task",
                          ),
                        ),
                      ),
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
}
