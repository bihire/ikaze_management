import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/customDropDown/show_dropdown.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/components/page_transition/enum.dart';
import 'package:inventory_controller/components/page_transition/page_transtion.dart';
import 'package:inventory_controller/views/newProduct/new_product.dart';

class CustomDropdown extends StatefulWidget {
  final Widget child;
  final String text;

  const CustomDropdown({Key key, @required this.child, @required this.text})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey actionKey;
  // double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = GlobalKey();
    super.initState();
  }

  Future<void> _showMyDialog(
      double height, double width, double xPosition, double yPosition) async {
    return showCustomDropDown<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      height: height,
      width: width,
      xPosition: xPosition,
      yPosition: yPosition,
      builder: (BuildContext context) {
        return DropDown(
          itemHeight: height,
        );
      },
    );
  }

  PopUpLocationdata findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    double height = renderBox.size.height;
    double width = MediaQuery.of(context).size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    double xPosition = offset.dx;
    double yPosition = offset.dy;

    return PopUpLocationdata(
        height: height,
        width: width,
        xPosition: xPosition,
        yPosition: yPosition);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () async {
        RenderBox renderBox = actionKey.currentContext.findRenderObject();
        double height = renderBox.size.height;
        double width = MediaQuery.of(context).size.width;
        Offset offset = renderBox.localToGlobal(Offset.zero);
        double xPosition = offset.dx;
        double yPosition = offset.dy;
        _showMyDialog(height, width, xPosition, yPosition);
      },
      child: widget.child,
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;

  const DropDown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment(.96, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 10,
              width: 15,
              decoration: BoxDecoration(color: primaryColor
                  // Colors.red.shade600,
                  ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              // shape: Sha.circle(8),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                child: Column(
                  children: <Widget>[
                    DropDownItem.first(
                        text: "Add new product",
                        iconData: Icons.add,
                        isSelected: false,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              PageTransition(
                                  curve: Curves.easeIn,
                                  reverseDuration: Duration(milliseconds: 300),
                                  duration: Duration(milliseconds: 200),
                                  child: NewProductPage(),
                                  type: PageTransitionType.rightToLeft));
                        }),
                    DropDownItem(
                      text: "Search by range",
                      iconData: Icons.search,
                      isSelected: false,
                    ),
                    DropDownItem.last(
                      text: "Logout",
                      iconData: Icons.exit_to_app,
                      isSelected: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  final Function onPressed;

  const DropDownItem(
      {Key key,
      this.text,
      this.iconData,
      this.onPressed,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false})
      : super(key: key);

  factory DropDownItem.first(
      {String text, IconData iconData, bool isSelected, Function onPressed}) {
    return DropDownItem(
      text: text,
      iconData: iconData,
      isSelected: isSelected,
      isFirstItem: true,
      onPressed: onPressed,
    );
  }

  factory DropDownItem.last(
      {String text, IconData iconData, bool isSelected, Function onPressed}) {
    return DropDownItem(
      text: text,
      iconData: iconData,
      isSelected: isSelected,
      isLastItem: true,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: isFirstItem ? Radius.circular(8) : Radius.zero,
            bottom: isLastItem ? Radius.circular(8) : Radius.zero,
          ),
          color: isSelected ? Colors.transparent : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                  color: hardGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Icon(
              iconData,
              color: hardGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArrowShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }
}
