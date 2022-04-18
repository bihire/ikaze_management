import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

// class DropDownSelect extends StatefulWidget {

//   @override
//   _DropDownSelectState createState() => _DropDownSelectState();
// }

/// This is the private State class that goes with MyStatefulWidget.
class DropDownSelect extends StatelessWidget {
  DropDownSelect(
      {Key? key, required this.items, required this.onChanged, required this.unitQty})
      : super(key: key);
  final List<String> items;
  final void Function(String?)? onChanged;
  final String unitQty;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: unitQty,
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: primaryColor,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: hardGreyColor),
      underline: Container(
        height: 1,
        color: hardGreyColor,
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
