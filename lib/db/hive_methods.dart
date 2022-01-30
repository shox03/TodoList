// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:todo_app/view/widgets/bottom_sheet_button.dart';

// class HiveMethods implements BottomSheetButton {
//   List<Map<String, dynamic>> items = [];

//   final tasksBox = Hive.box('task_box');

//   @override
//   void initState() {
//     super.initState();
//     _refreshItems(); // Load data when app starts
//   }

//   @override
//   init() async {
//     _refreshItems();
    
//   }

//   // Get all items from the database
//   void _refreshItems() {
//     final data = tasksBox.keys.map((key) {
//       final value = tasksBox.get(key);
//       return {"key": key, "task": value["task"], "color": value["color"]};
//     }).toList();

//     setState(() {
//       items = data.reversed.toList();
//       // we use "reversed" to sort items in order from the latest to the oldest
//     });
//   }

//   // Create new item
//   Future<void> _createItem(Map<String, dynamic> newItem) async {
//     await tasksBox.add(newItem);

//     _refreshItems(); // update the UI
//   }

//   // Retrieve a single item from the database by using its key
//   // Our app won't use this function but I put it here for your reference
//   Map<String, dynamic> _readItem(int key) {
//     final item = tasksBox.get(key);
//     return item;
//   }

//   // Update a single item
//   Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
//     await tasksBox.put(itemKey, item);
//     _refreshItems(); // Update the UI
//   }

//   // Delete a single item
//   Future<void> _deleteItem(int itemKey) async {
//     await tasksBox.delete(itemKey);
//     _refreshItems(); // update the UI
//   }

//   // TextFields' controllers
//   final TextEditingController _taskController = TextEditingController();

//   // This function will be triggered when the floating button is pressed
//   // It will also be triggered when you want to update an item
//   String hive_box = "Call_Logs";

//   // @override
//   // init() async {
//   //   Directory dir = await getApplicationDocumentsDirectory();
//   //   Hive.init(dir.path);
//   // }

//   @override
//   addLogs(Log log) async {
//     var box = await Hive.openBox(hive_box);

//     var logMap = log.toMap(log);

//     // box.put("custom_key", logMap);
//     int idOfInput = await box.add(logMap);

//     close();

//     return idOfInput;
//   }

//   updateLogs(int i, Log newLog) async {
//     var box = await Hive.openBox(hive_box);

//     var newLogMap = newLog.toMap(newLog);

//     box.putAt(i, newLogMap);

//     close();
//   }

//   @override
//   Future<List<Log>> getLogs() async {
//     var box = await Hive.openBox(hive_box);

//     List<Log> logList = [];

//     for (int i = 0; i < box.length; i++) {
//       var logMap = box.getAt(i);

//       logList.add(Log.fromMap(logMap));
//     }
//     return logList;
//   }

//   @override
//   deleteLogs(int logId) async {
//     var box = await Hive.openBox(hive_box);

//     await box.deleteAt(logId);
//     // await box.delete(logId);
//   }

//   @override
//   close() => Hive.close();
// }
