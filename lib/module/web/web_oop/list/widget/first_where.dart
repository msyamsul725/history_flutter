import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

// Daftar produk
final List<Product> productList = [
  Product(id: 1, name: 'Laptop', price: 15000000),
  Product(id: 2, name: 'Smartphone', price: 8000000),
  Product(id: 3, name: 'Tablet', price: 5000000),
];

class FirstWherePage extends StatefulWidget {
  const FirstWherePage({super.key});

  @override
  _FirstWherePageState createState() => _FirstWherePageState();
}

class _FirstWherePageState extends State<FirstWherePage> {
  int? selectedProductId;
  Product? selectedProduct;

  // Fungsi untuk mencari produk berdasarkan ID
  void findProductById(int id) {
    setState(() {
      selectedProduct = productList.firstWhere(
        (product) => product.id == id,
        orElse: () => Product(id: 0, name: 'Produk tidak ditemukan', price: 0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown untuk memilih produk berdasarkan ID
          DropdownButton<int>(
            value: selectedProductId,
            hint: const Text('Pilih ID Produk'),
            items: productList.map((Product product) {
              return DropdownMenuItem<int>(
                value: product.id,
                child: Text('ID: ${product.id} - ${product.name}'),
              );
            }).toList(),
            onChanged: (int? value) {
              setState(() {
                selectedProductId = value;
              });
              if (value != null) {
                findProductById(value); // Cari produk berdasarkan ID
              }
            },
          ),
          const SizedBox(height: 20),

          // Tampilkan detail produk yang dipilih
          selectedProduct == null
              ? const Text('Belum ada produk yang dipilih')
              : selectedProduct!.id == 0
                  ? const Text(
                      'Produk tidak ditemukan',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama: ${selectedProduct!.name}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Harga: Rp ${selectedProduct!.price.toStringAsFixed(0)}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
        ],
      ),
    );
  }
}
