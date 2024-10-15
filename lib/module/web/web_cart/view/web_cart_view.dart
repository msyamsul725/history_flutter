import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/web/web_cart/controller/web_cart_controller.dart';
import 'package:hyper_ui/module/web/web_cart/model/cart_list_data.dart';
import 'package:hyper_ui/module/web/web_cart/widget/cart_screen_list_tile_card.dart';
import 'package:hyper_ui/shared/util/intl/format_rupiah.dart';

class WebCartView extends StatefulWidget {
  const WebCartView({super.key});

  Widget build(context, WebCartController controller) {
    controller.view = this;
  final Map<String, List<CartData>> groupedItems = {};
    for (CartData item in controller.cartListModel.data ?? []) {
      // Ambil sellerName dari objek product

      String sellerName = item.product?.shopName ?? 'Unknown Seller';

      if (!groupedItems.containsKey(sellerName)) {
        groupedItems[sellerName] = [];
      }

      groupedItems[sellerName]!.add(item);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebCart"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
              
                width: 420,
                child: QCard(title: 'Flow Cart', children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:                         groupedItems.keys.length, // Total penjual yang ada
                    itemBuilder: (context, int index) {
                      String sellerName =
                          groupedItems.keys.elementAt(index);
                      List<CartData> products =
                          groupedItems[sellerName]!;
                                  
                      // Initialize the seller's checkbox state if it doesn't exist
                      controller.selectedSellersPrimary
                          .putIfAbsent(sellerName, () => false);
                                  
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Menampilkan nama penjual
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value:
                                            controller.selectedSellersPrimary[
                                                    sellerName] ??
                                                false,
                                        onChanged: (value) {
                                          controller.toggleSellerSelection(
                                              sellerName, value!);
                                          // Pilih semua produk jika penjual dipilih
                                          for (var product in products) {
                                            controller.toggleProductSelection(
                                                product.id!, value);
                                          }
                                        },
                                      ),
                                      Text(
                                        sellerName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Icon(
                                        color: Colors.grey,
                                        Icons.chevron_right_outlined,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Ubah",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Menampilkan produk-produk dari penjual tersebut
                            ListView.builder(
                              physics:
                                  const NeverScrollableScrollPhysics(), // Supaya tidak terjadi scrolling nested
                              shrinkWrap: true,
                              itemCount: products.length,
                              itemBuilder: (context, int productIndex) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CartListTileCard(
                                    cartData: products[productIndex],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                     SizedBox(
                height: 10.0,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                  color: Colors.green.withOpacity(0.2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Pembayaran",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            formatRupiah(controller.totalPrice.toInt()),
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Check Out",
                            style: TextStyle(fontSize: 12, color: Colors.white,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WebCartView> createState() => WebCartController();
}
