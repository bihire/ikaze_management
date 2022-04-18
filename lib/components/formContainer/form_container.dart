import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/onScrollShadow/onscrollshadow_cubit.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/utils/debounce.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';

class FormContainer extends StatefulWidget {
  final List<Widget> slivers;
  final AppBar appBar;
  final String? error;
  FormContainer({Key? key, this.slivers = const [], required this.appBar, this.error}): super(key: key);
  @override
  State<FormContainer> createState() => FormContainerState();
}

class FormContainerState extends State<FormContainer> {
  late ScrollController controller;
  late OnscrollshadowCubit onscrollshadowCubit;

  // late SalestransactionlistBloc salesTransactionListBloc;

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    onscrollshadowCubit = OnscrollshadowCubit();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  // @override
  // void didUpdateWidget(covariant FormContainer oldWidget) {
  //   if(widget.error !== null) {

  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: BlocBuilder<OnscrollshadowCubit, OnscrollshadowState>(
          bloc: onscrollshadowCubit,
          builder: (context, state) {
            return AppBar(
                iconTheme: widget.appBar.iconTheme,
                backgroundColor: widget.appBar.backgroundColor,
                titleSpacing: widget.appBar.titleSpacing,
                elevation: state.isShadow == true ? widget.appBar.elevation : 0,
                shadowColor: widget.appBar.shadowColor,
                automaticallyImplyLeading:
                    widget.appBar.automaticallyImplyLeading,
                title: widget.appBar.title);
          },
        ),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: widget.slivers,
      ),
    );
  }

  void _scrollListener() {
    if (controller.position.extentBefore == 0.0 &&
        onscrollshadowCubit.state.isShadow == true) {
      onscrollshadowCubit.removeShadow();
    } else if (controller.position.extentBefore != 0.0 &&
        onscrollshadowCubit.state.isShadow == false) {
      onscrollshadowCubit.addShadow();
    }
  }
}
