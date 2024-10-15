import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/web/web_cart/controller/web_cart_controller.dart';
import 'package:hyper_ui/module/web/web_cart/model/cart_list_data.dart';
import 'package:hyper_ui/module/web/web_cart/widget/custom_stepper.dart';
import 'package:hyper_ui/shared/util/intl/format_rupiah.dart';

class CartListTileCard extends StatelessWidget {
  final CartData cartData;

  const CartListTileCard({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    final controller = WebCartController.instance;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.green,
            value: controller.selectedProducts[cartData.id ?? ''] ?? false,
            onChanged: (value) {
              controller.toggleProductSelection(cartData.id!, value!);
              controller.calculateTotalPrice(controller.selectedSellersPrimary);
            },
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 24,
                  offset: Offset(0, 11),
                ),
              ],
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(cartData.product?.image ??
                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartData.product?.title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              cartData.product?.brandName ?? '-',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatRupiah(int.parse(cartData.product?.price ?? '0')),
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 85,
                        child: FittedBox(
                          child: CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 20,
                            stepValue: 1,
                            value: cartData.numberOfItems,
                            onChanged: (int value) {
                              controller.changeItem(cartData.id!, value);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



             // GetBuilder<DeleteCartListController>(
                      //     builder: (deleteController) {
                      //   return IconButton(
                      //       onPressed: () async {
                      //         bool delete = await deleteController
                      //             .deleteCartId(cartData.productId!);
                      //         if (delete) {
                      //           Get.snackbar(
                      //               "success", "products deleted successfully");
                      //         } else {
                      //           Get.snackbar(
                      //               "failed", "products delete failed");
                      //         }
                      //       },
                      //       icon: const Icon(Icons.delete_outline));
                      // })