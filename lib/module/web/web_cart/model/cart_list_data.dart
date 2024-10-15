import 'package:hyper_ui/module/web/web_cart/model/products.dart';

class CartData {
  String? id;
  String? email;
  String? productId;

  String? createdAt;
  String? updatedAt;
  Product? product; // Keep this as a Product type
  int numberOfItems = 1;

  CartData({
    this.id,
    this.email,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  // Updated fromJson method
  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    numberOfItems = json['total_item'];

    // Ensure we deserialize the product correctly
    if (json['product'] != null) {
      product = Product.fromJson(json['product']);
    } else {
      product = null;
    }
  }

  // Updated toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_item'] = numberOfItems;

    // Serialize the product if it exists
    if (product != null) {
      data['product'] = product!.toJson(); // Call the toJson method of Product
    }

    return data;
  }
}
