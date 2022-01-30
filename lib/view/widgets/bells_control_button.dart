import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/constants/app_icons.dart';
import 'package:todo_app/model/list_model.dart';

class BellsButton extends StatefulWidget {
  int? index;
  BellsButton({Key? key, required this.index}) : super(key: key);

  @override
  State<BellsButton> createState() => _BellsButtonState();
}

class _BellsButtonState extends State<BellsButton> {
  @override
  Widget build(BuildContext context) {
    bool _color = false;
    return InkWell(
      onTap: () {
        setState(() {
          _color != _color;
        });
      },
      child: SvgPicture.asset(APPIcons.smallBells,
          color: _color == false ? Colors.grey : Colors.yellow),
    );
  }
}
