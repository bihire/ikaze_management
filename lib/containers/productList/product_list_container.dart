import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/blocs/home/product_list/product_list_bloc.dart';
import 'package:inventory_controller/models/product/product.dart';
// import 'package:inventory_controller/redux/actions/productList/product_list.dart';
import 'package:inventory_controller/views/homePage/floatingButton/floating_dialogue.dart';
// import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

class ProductListContainer extends StatefulWidget {
  final Function? setProduct;
  final ProductModel? product;
  final bool selectable;
  ProductListContainer(
      {this.setProduct, this.selectable = false, this.product});

  @override
  _ProductListContainerState createState() => _ProductListContainerState();
}

class _ProductListContainerState extends State<ProductListContainer> {
  late ProductListBloc productListBloc;
  @override
  void initState() {
    productListBloc = ProductListBloc();
    productListBloc.add(LoadProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      bloc: productListBloc,
      builder: (context, state) {
        return state is ProductListInitial
            ? Container()
            : ProductListScreen(
                product: widget.product,
                setProduct: widget.setProduct,
                selectable: widget.selectable,
                loading: state is ProductListLoading ? true : false,
                products: state.products,
                error: state.error,
              );
      },
    );
  }
}
