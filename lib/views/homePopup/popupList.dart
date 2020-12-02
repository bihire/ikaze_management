import 'package:flutter/material.dart';
import 'package:inventory_controller/redux/actions/popup_action.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
import 'package:redux/redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class PopupListScreen extends StatefulWidget {
  PopupListScreen({this.underLine, this.store});
  final bool underLine;
  final Store<AppState> store;

  @override
  _PopupListStateScreen createState() => _PopupListStateScreen();
}

class _PopupListStateScreen extends State<PopupListScreen> {
  ScrollController _scrollController = ScrollController();

  // var scrollPos = false;

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
    return Expanded(
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
              widget.store.dispatch(UnderLineAction(underLine: false));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetail()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
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
    );
  }

  void _onScroll() {
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 2 && widget.underLine == false) {
      widget.store.dispatch(UnderLineAction(underLine: true));
    } else if (currentScroll < 2 && widget.underLine == true) {
      widget.store.dispatch(UnderLineAction(underLine: false));
    }
  }
}
