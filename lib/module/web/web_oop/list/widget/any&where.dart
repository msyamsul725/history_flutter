import 'package:flutter/material.dart';

class AnyWherePage extends StatefulWidget {
  const AnyWherePage({super.key});

  @override
  _AnyWherePageState createState() => _AnyWherePageState();
}

class _AnyWherePageState extends State<AnyWherePage> {
  // List untuk menampung hasil pencarian
  List<Order> filteredListHistory = orders;
  String searchQuery = '';

  // Fungsi untuk melakukan pencarian
  void searchProduct(String query) {
    setState(() {
      searchQuery = query;

      // Jika query tidak kosong, filter produk berdasarkan title
      if (query.isNotEmpty) {
        filteredListHistory = orders.where((order) {
          return order.orderItems.any((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()));
        }).toList();
      } else {
        // Jika kosong, tampilkan semua order
        filteredListHistory = orders;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextField untuk input pencarian
        SizedBox(
          height: 40,
          child: TextField(
            onChanged: searchProduct,
            decoration: const InputDecoration(
              labelText: 'Cari Produk',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Menampilkan hasil pencarian dalam ListView
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: filteredListHistory.length,
            itemBuilder: (context, index) {
              final order = filteredListHistory[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    'Order ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: order.orderItems
                        .map((product) => Text(product.title))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Product {
  final String title;

  Product({required this.title});
}

class Order {
  final List<Product> orderItems;

  Order({required this.orderItems});
}

final List<Order> orders = [
  Order(orderItems: [
    Product(title: 'Laptop Gaming'),
    Product(title: 'Mouse Wireless'),
  ]),
  Order(orderItems: [
    Product(title: 'Tablet Android'),
    Product(title: 'Keyboard Mechanical'),
  ]),
  Order(orderItems: [
    Product(title: 'Smartphone 5G'),
    Product(title: 'Charger Fast'),
  ]),
];
