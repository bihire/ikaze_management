import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class DropDownSelect extends StatefulWidget {
  DropDownSelect({Key key, @required this.items}) : super(key: key);
  List<String> items;
  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownSelectState extends State<DropDownSelect> {
  String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: primaryColor,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: hardGreyColor),
      underline: Container(
        height: 2,
        color: lightGreyColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
