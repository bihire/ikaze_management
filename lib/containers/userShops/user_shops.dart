import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/userShops/user_shops_bloc.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/views/shops/my_shops.dart';

class UserShopsContainer extends StatefulWidget {
  @override
  State<UserShopsContainer> createState() => _UserShopsContainerState();
}

class _UserShopsContainerState extends State<UserShopsContainer> {
  late UserShopsBloc userShopsBloc;
  @override
  void initState() {
    userShopsBloc = UserShopsBloc();
    userShopsBloc.add(LoadUserShops());
    super.initState();
  }

  @override
  void dispose() {
    userShopsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserShopsBloc, UserShopsState>(
      bloc: userShopsBloc,
      builder: (context, state) {
        if (state.status == ShopStatus.loading)
          return Material(child: LoadingIndicator());
        if (state.status == ShopStatus.success) return MyShops(shops: state.shops);
        if (state.status == ShopStatus.error)
          return Material(
            child: Container(
              child: Center(
                child: Text('error'),
              ),
            ),
          );
        return Material(child: Container());
      },
    );
  }
}
