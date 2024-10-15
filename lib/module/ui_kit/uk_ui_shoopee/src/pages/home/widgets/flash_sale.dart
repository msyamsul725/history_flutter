
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/models/flash_sale_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/utils/format.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/viewmodels/flash_sale_view_model.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/src/widgets/discount_painter.dart';
import 'package:hyper_ui/module/ui_kit/uk_ui_shoopee/theme/contans.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FlashSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
        FlashSaleList(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildFlashSaleImage(),
          SizedBox(width: 8),
          // _buildCountDown(),
          Spacer(),
       Text("Lihat semua",style: TextStyle(
       color: Colors.grey,
       ),),
       const Icon(
       Icons.chevron_right,
       size: 24.0,
       ),
       const SizedBox(
       width: 10.0,
       ),
        ],
      ),
    );
  }

  // CountdownFormatted _buildCountDown() => CountdownFormatted(
  //       duration: Duration(hours: 2),
  //       builder: (BuildContext context, String remaining) {
  //         final showTime = (String text) => Container(
  //               width: 30,
  //               alignment: Alignment.center,
  //               margin: EdgeInsets.symmetric(horizontal: 3),
  //               decoration: BoxDecoration(
  //                 color: Colors.black,
  //                 borderRadius: BorderRadius.circular(2),
  //               ),
  //               child: Text(
  //                 text,
  //                 style: TextStyle(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             );

              
  //         List<String> time = remaining.split(':').toList();
  //         return Row(
  //           children: [
  //             showTime(time[0]),
  //             showTime(time[1]),
  //             showTime(time[2]),
  //           ],
  //         ); // 01:00:00
  //       },
  //     );

//  ElevatedButton _buildMoreButton() => ElevatedButton(
//         onPressed: () {
//           print("click");
//         },

//         child: Text(
//        "Lihat semua",
//           style: TextStyle(
//             color: Colors.black54,
//           ),
//         ),
//       );

  Image _buildFlashSaleImage() => Image.asset(
        "assets/images/ic_flash_sale.png",
        width: 100,
      );
}

class FlashSaleList extends StatelessWidget {
  final List<FlashSaleModel> _flashSaleViewModel =
      FlashSaleViewModel().getFlashSale();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      height: 200.0,
      color: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: _flashSaleViewModel.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _flashSaleViewModel.length) {
            return _buildMore();
          }

          final flashSale = _flashSaleViewModel[index];
          return FlashSaleItem(flashSale);
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 8),
      ),
    );
  }

  GestureDetector _buildMore() {
    final Color color = primaryb2b;
    return GestureDetector(
      onTap: (){
        print("click");
      },
      child: SizedBox(
        width: 150,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45.0,
              height: 45.0,
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                border: Border.all(
                  color: color,
                  width: 2.5,
                ),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: color,
              ),
            ),
            Text(
              "Lihat semuaya",
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlashSaleItem extends StatelessWidget {
  final FlashSaleModel flashSale;

  const FlashSaleItem(this.flashSale);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("click");
      },
      child: Column(
        children: [
          Stack(
            children: [
              _buildProductImage(),
              if (flashSale.discountPercentage != 0) _buildDiscount(),
              if (flashSale.mall!) _buildMall(),
            ],
          ),
          _buildPrice(),
          SizedBox(height: 8),
          _buildSold(),
        ],
      ),
    );
  }

  Image _buildProductImage() => Image.network(
        flashSale.image!,
        height: 150,
        width: 150,
      );

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
                  "${flashSale.discountPercentage}%",
                  style: TextStyle(
                    color: primaryb2b,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "%",
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

  RichText _buildPrice() => RichText(
        text: TextSpan(
          text: '\$ ',
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '${Format().currency(flashSale.price!, decimal: false)}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      );

  Stack _buildSold() {
    final percent = flashSale.sold! / flashSale.qty!;
    return Stack(

      children: [
        LinearPercentIndicator(
          center: Text(
           "Harga ${Format().currency(flashSale.sold!.toDouble(), decimal: false)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          width: 130.0,
          lineHeight: 17.0,
          percent: percent,
          backgroundColor: Colors.grey[400],
          progressColor: primaryb2b,
        ),
        if (percent >= 0.5)
          Positioned(
            top: -10,
            left: 4,
            child: SvgPicture.network(
              "https://image.flaticon.com/icons/svg/785/785116.svg",
              width: 20,
              height: 20,
            ),
          ),
      ],
    );
  }
}
