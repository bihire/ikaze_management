import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class RoundCheckbox extends StatefulWidget {
  final bool isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  late String name;

  RoundCheckbox(
      {required this.isChecked,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  RoundCheckbox.withText(
      {required this.isChecked,
      this.size,
      required this.name,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  // bool _isSelected = false;

  // @override
  // void initState() {
  //   _isSelected = widget.isChecked ?? false;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              color: widget.isChecked
                  ? widget.selectedColor ?? primaryColor
                  : Colors.transparent,
              // borderRadius: BorderRadius.circular(5.0),
              shape: BoxShape.circle,
              border: widget.isChecked
                  ? null
                  : Border.all(
                      color: lightGreyColor,
                      width: 2.0,
                    )),
          width: widget.size ?? 30,
          height: widget.size ?? 30,
          child: widget.isChecked
              ? Icon(
                  Icons.check,
                  color: widget.selectedIconColor ?? Colors.white,
                  size: widget.iconSize ?? 19,
                )
              : null,
        ),
        widget.name != null
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 3),
                child: Row(
                  children: <Widget>[
                    widget.name != null ? SizedBox() : Icon(
                      Icons.radio_button_unchecked,
                      color: primaryColor,
                      size: 7.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

// class RoundCheckboxItem extends StatefulWidget {
//   final bool isChecked;
//   final double size;
//   final name;
//   final double iconSize;
//   final Color selectedColor;
//   final Color selectedIconColor;

//   RoundCheckboxItem(
//       {this.isChecked,
//       this.size,
//       this.name,
//       this.iconSize,
//       this.selectedColor,
//       this.selectedIconColor});

//   @override
//   _RoundCheckboxItemState createState() => _RoundCheckboxItemState();
// }

// class _RoundCheckboxItemState extends State<RoundCheckbox> {
//   bool _isSelected = false;

//   @override
//   void initState() {
//     _isSelected = widget.isChecked ?? false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isSelected = !_isSelected;
//         });
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 500),
//         curve: Curves.fastLinearToSlowEaseIn,
//         decoration: BoxDecoration(
//             color: _isSelected
//                 ? widget.selectedColor ?? Colors.blue
//                 : Colors.transparent,
//             // borderRadius: BorderRadius.circular(5.0),
//             shape: BoxShape.circle,
//             border: _isSelected
//                 ? null
//                 : Border.all(
//                     color: lightGreyColor,
//                     width: 2.0,
//                   )),
//         width: widget.size ?? 30,
//         height: widget.size ?? 30,
//         child: _isSelected
//             ? Icon(
//                 Icons.check,
//                 color: widget.selectedIconColor ?? Colors.white,
//                 size: widget.iconSize ?? 19,
//               )
//             : null,
//       ),
//     );
//   }
// }
