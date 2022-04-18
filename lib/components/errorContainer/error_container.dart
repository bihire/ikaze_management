import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class Errorcontainer extends StatefulWidget {
  final String? error;
  final Function()? close;
  final VoidCallback scrollTop;
  Errorcontainer(
      { required this.error, required this.close, required this.scrollTop});
  @override
  _ErrorcontainerState createState() => _ErrorcontainerState();
}

class _ErrorcontainerState extends State<Errorcontainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Errorcontainer oldWidget) {
    if (widget.error != null) {
      _controller.forward().whenComplete(() {
        widget.scrollTop();
      });
    }
    if (widget.error == null) {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // AnimationController _animationController;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      axisAlignment: -1,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.red[700], borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: widget.close,
                  child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: primaryLightColor,
                      )),
                ),
              ],
            ),
            Container(
              child: widget.error != null
                  ? Text(
                      widget.error!,
                      style: TextStyle(color: primaryLightColor),
                      textAlign: TextAlign.left,
                    )
                  : Text(
                      '',
                      style: TextStyle(color: primaryLightColor),
                      textAlign: TextAlign.left,
                    ),
            )
          ],
        ),
        // height: 200,
      ),
    );
  }
}
