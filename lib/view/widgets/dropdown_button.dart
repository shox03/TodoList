import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      value: _value,
      items: const [
        DropdownMenuItem(
          child: Text("Choose Date"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("Today, 19:00 - 21:00"),
          value: 2,
        )
      ],
      onChanged: (int? value) {
        setState(() {
          _value = value;
        });
      },
      hint: Text("Select item"),
    );
  }
}
