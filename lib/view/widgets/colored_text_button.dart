import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/list_model.dart';

class ColoredButton extends StatelessWidget {
  int? index;
  ColoredButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksBox = Hive.box('task_box');
    Future<void> _createItem(Map<String, dynamic> newItem) async {
      await tasksBox.add(newItem);
    }

    return ValueListenableBuilder(
      valueListenable: Hive.box("task_box").listenable(),
      builder: (context, Box box, widget) {
        return ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor:
                getColor(Colors.white, Listofcontexts.colorOFcircle[index!]),
          ),
          child: Text(
            Listofcontexts.nameOfprojects[index!],
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            
          },
        );
      },
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPassed) {
    final getColor = (Set<MaterialState> state) {
      if (state.contains(MaterialState.pressed)) {
        return colorPassed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith((getColor));
  }
}
