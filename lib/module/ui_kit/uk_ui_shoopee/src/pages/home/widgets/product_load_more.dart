import 'package:flutter/material.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/models/product_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/utils/format.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/viewmodels/product_view_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/widgets/discount_painter.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/theme/contans.dart';


class ProductLoadMore extends StatelessWidget {

  final List<ProductModel> _productViewModel = ProductViewModel().getProduct();

  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildProductList(),
        ],
      ),
    );
  }

  Container _buildHeader() => Container(
    color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Text(
          "Produk yang direkomendasikan",
          style: TextStyle(
            color: primaryb2b,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Column _buildProductList() => Column(
    children: [
      GridView.builder(
        padding: EdgeInsets.all(6),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _productViewModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0 / 1.4,
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductItemCard(_productViewModel[index]);
        },
      ),
      false ? SizedBox(height: 150) : BottomLoader(),
    ],
  );
}

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard(this.product);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildProductImage(constraints.maxHeight),
              _buildProductInfo(),
            ],
          ),
        );
      },
    );
  }

  Stack _buildProductImage(double maxHeight) {
    return Stack(
      children: <Widget>[
        Image.network(
          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
          height: maxHeight - 82,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        if (product.discountPercentage != 0) _buildDiscount(),
        if (product.mall) _buildMall(),
        if (product.shopRecommended) _buildShopRecommended(),
      ],
    );
  }

  Positioned _buildDiscount() => Positioned(
    right: 0,
    child: Container(
      height: 180,
      width: 38,
      child: CustomPaint(
        painter: DiscountPainter(),
        size: Size(35, 180),
        child: Column(
          children: [
            SizedBox(height: 3),
            Text(
              "${product.discountPercentage}%",
              style: TextStyle(
                color: primaryb2b,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              "diskon",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Container _buildMall() => Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Color(0xffd0011b),
      borderRadius: BorderRadius.circular(2),
    ),
    child: Text(
      "Mall",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    ),
  );

  Container _buildShopRecommended() => Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: primaryb2b,
      borderRadius: BorderRadius.circular(2),
    ),
    child: Text(
      "Toko yang direkomendasikan",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    ),
  );

  Padding _buildProductInfo() => Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            _buildName(),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPrice(),
                _buildSold(),
              ],
            ),
          ],
        ),
      );

  Text _buildName() => Text(
        product.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  RichText _buildPrice() => RichText(
        text: TextSpan(
          text: '\$ ',
          style: TextStyle(
            color: primaryb2b,
            fontSize: 12,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '${Format().currency(product.price, decimal: false)}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );

  Text _buildSold() => Text(
        "Harga ${product.sold}",
        style: TextStyle(
          fontSize: 10,
        ),
      );
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 22),
      width: double.infinity,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          "Lihat",
          style: TextStyle(
            color: primaryb2b,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
