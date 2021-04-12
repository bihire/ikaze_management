import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/productList/product_list.dart';
import 'package:inventory_controller/redux/actions/productList/product_list.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> productListMiddleware() {
  return TypedMiddleware<AppState, LoadProductListAction>(_loadItemsPage());
}

_loadItemsPage() {
  return (Store<AppState> store, LoadProductListAction action,
      NextDispatcher next) {
    next(action);
    _loadFlutterGithubIssues().then(
      (itemsPage) {
        store.dispatch(ProductListLoadedAction(itemsPage));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<ProductModel>> _loadFlutterGithubIssues() async {
  await new Future.delayed(const Duration(seconds: 5));
  var response = await http.get('http://192.168.137.97:5000/api/products');
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData.map((item) => ProductModel.fromJson(item)).toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
