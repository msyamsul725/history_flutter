import 'package:flutter/material.dart';
import 'package:hyper_ui/module/web/web_cart/data/cart_data.dart';
import 'package:hyper_ui/module/web/web_cart/model/cart_list_data.dart';
import 'package:hyper_ui/module/web/web_cart/model/cart_list_model.dart';
import 'package:hyper_ui/module/web/web_cart/view/web_cart_view.dart';

class WebCartController extends State<WebCartView> {
  static late WebCartController instance;
  late WebCartView view;
  final bool _cartListInProgress = false;
  CartListModel _cartListModel = CartListModel();
  double _totalPrice = 0;
  final String _message = '';
  Map<String, bool> selectedSellersPrimary = {};
  Map<String, bool> selectedProducts =
      {}; // Menyimpan status checkbox untuk produk

  bool get cartListInProgress => _cartListInProgress;

  CartListModel get cartListModel => _cartListModel;

  double get totalPrice => _totalPrice;

  String get message => _message;

  Future<bool> getCartList() async {
    setState(() {
      _cartListModel = CartListModel.fromJson(dataCart);
    });

    return false;
  }

  // Tambahkan metode untuk memperbarui status checkbox
  void toggleSellerSelection(String shopName, bool isSelected) {
    selectedSellersPrimary[shopName] = isSelected;
    setState(() {});
  }

  void changeItem(String cartId, int noOfItems) {
    _cartListModel.data
        ?.firstWhere((cartData) => cartData.id == cartId)
        .numberOfItems = noOfItems;
    calculateTotalPrice(selectedSellersPrimary);
  }

  void toggleProductSelection(String productId, bool isSelected) {
    // Menyimpan status checkbox produk
    selectedProducts[productId] = isSelected;

    // Dapatkan shopName dari produk berdasarkan productId
    final shopName = cartListModel.data
        ?.firstWhere(
          (data) => data.id == productId,
          orElse: () =>
              CartData(), // Kembalikan objek default jika tidak ditemukan
        )
        .product
        ?.shopName;

    if (shopName != null) {
      // Jika produk tidak dipilih, hapus pilihan dari penjual
      if (!isSelected) {
        selectedSellersPrimary[shopName] = false; // Hapus pilihan penjual
      } else {
        // Jika produk dipilih, cek apakah semua produk dari penjual sudah dipilih
        final allProductsFromSellerSelected = cartListModel.data
                ?.where(
                  (data) => data.product?.shopName == shopName,
                )
                .every((data) => selectedProducts[data.id ?? ''] == true) ??
            false;

        // Jika semua produk dari penjual dipilih, set checkbox penjual menjadi true
        selectedSellersPrimary[shopName] = allProductsFromSellerSelected;
      }
    }

    // Hitung total harga berdasarkan produk yang dipilih
    calculateTotalPrice(selectedSellersPrimary);
    setState(() {});
  }

  void calculateTotalPrice(Map<String, bool> selectedSellers) {
    _totalPrice = 0;

    for (CartData data in cartListModel.data ?? []) {
      // Hanya tambahkan produk jika terpilih
      if (selectedProducts[data.id ?? ''] == true) {
        _totalPrice += (data.numberOfItems *
            (double.tryParse(data.product?.price ?? '0') ?? 0));
      }
    }

    // Update status selectedSellers berdasarkan produk yang terpilih
    for (CartData data in cartListModel.data ?? []) {
      final shopName = data.product?.shopName;
      if (shopName != null) {
        selectedSellers[shopName] = cartListModel.data
                ?.where((item) =>
                    item.product?.shopName == shopName &&
                    selectedProducts[item.id ?? ''] == true)
                .length ==
            cartListModel.data
                ?.where((item) => item.product?.shopName == shopName)
                .length;
      }
    }

    selectedSellersPrimary = selectedSellers;
    setState(() {});
  }

  @override
  void initState() {
    instance = this;
    getCartList();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
