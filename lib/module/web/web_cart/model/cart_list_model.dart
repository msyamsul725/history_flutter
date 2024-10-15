import 'package:hyper_ui/module/web/web_cart/model/cart_list_data.dart';

class CartListModel {
  List<CartData>? data;

  CartListModel({this.data});

  CartListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
