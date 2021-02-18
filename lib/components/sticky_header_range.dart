import 'package:flutter/material.dart';

class _StickyHeaderDateSort extends StatelessWidget {
  const _StickyHeaderDateSort({
    Key key,
    this.history,
  }) : super(key: key);

  final history;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: HeaderDatePicker(),
      sliver: SliverToBoxAdapter(
        child: ShrinkWrappingViewport(
          offset: ViewportOffset.zero(),
          slivers: [
            for (var key in history.keys)
              _StickyHeaderList(keyTitle: key, keyData: history[key] )
          ],
        ),
      ),
    );
  }
}