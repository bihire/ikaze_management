import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:inventory_controller/containers/homePage/homePopup/popupAppbar_container.dart';
import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
import 'package:inventory_controller/views/PopupMenuButtonPage/PopupMenuButtonPage.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
import 'package:inventory_controller/views/all_products/all_products.dart';
import '../views/dashboard/dashboard.dart';


class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 75),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
        setState(() {
          // setState needs to be called to trigger a rebuild because
          // the 'HIDE FAB'/'SHOW FAB' button needs to be updated based
          // the latest value of [_controller.status].
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isAnimationRunningForwardsOrComplete {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
    assert(false);
    return null;
  }

  var loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: DashBoard(),
      floatingActionButton: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return FadeScaleTransition(
            animation: _controller,
            child: child,
          );
        },
        child: Visibility(
          visible: _controller.status != AnimationStatus.dismissed,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              if (_isAnimationRunningForwardsOrComplete) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Divider(height: 0.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    showModal<void>(
                      context: context,
                      configuration: FadeScaleTransitionConfiguration(barrierColor: Colors.black.withOpacity(.7)),
                      builder: (BuildContext context) {
                        return _ExampleAlertDialog(loading: loading);
                      },
                    );
                  },
                  child: const Text('SHOW MODAL'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_isAnimationRunningForwardsOrComplete) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  child: _isAnimationRunningForwardsOrComplete
                      ? const Text('HIDE FAB')
                      : const Text('SHOW FAB'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExampleAlertDialog extends StatefulWidget {
  _ExampleAlertDialog({
    this.loading,
  });
  final bool loading;
  @override
  __ExampleAlertDialogState createState() => __ExampleAlertDialogState();
}

class __ExampleAlertDialogState extends State<_ExampleAlertDialog> {
  ScrollController _scrollController = ScrollController();

  var scrollPos = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Expanded(
        
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Material(
            child: Column(
              children: [
                // HomePopupContainer(),
                PopupAppbarScreen(underLine: scrollPos),
                Expanded(
                  child:
                      // Container()
                      ListView.separated(
                    physics: BouncingScrollPhysics(
                        parent: const AlwaysScrollableScrollPhysics()), // new
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                    itemCount: 16,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemBuilder: (BuildContext ctxt, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          // width: MediaQuery.of(context).size.width * 1,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.blue,
                                size: 7.0,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                "Travetine",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 2 && scrollPos == false) {
      setState(() {
        scrollPos = true;
      });
    } else if (currentScroll < 2 && scrollPos == true) {
      setState(() {
        scrollPos = false;
      });
    }
  }
}
