class Product {
  String? id;
  String? title;

  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  double? star;
  int? totalOrders;
  int? categoryId;
  String? brandName;
  String? createdAt;
  String? updatedAt;
  String? shopName;

  Product(
      {this.id,
      this.title,
      this.price,
      this.discount,
      this.discountPrice,
      this.image,
      this.stock,
      this.star,
      this.categoryId,
      this.brandName,
      this.totalOrders,
      this.createdAt,
      this.updatedAt,
      this.shopName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    totalOrders = json['sold'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    categoryId = json['category_id'];
    brandName = json['brand_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopName = json['shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;
    data['stock'] = stock;
    data['star'] = star;
    data['category_id'] = categoryId;
    data['brand_name'] = brandName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['sold'] = totalOrders;
    data['shop_name'] = shopName;

    return data;
  }
}
