import 'package:hive_flutter/adapters.dart';

workWithHive() async {
  var box = await Hive.openBox('listBox');
  box.put('name', 'David');
  print('Name ${box.get('name')}');
}
