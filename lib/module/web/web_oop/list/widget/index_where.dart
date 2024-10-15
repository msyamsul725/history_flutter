import 'package:flutter/material.dart';

class IndexWherePage extends StatefulWidget {
  const IndexWherePage({super.key});

  @override
  _IndexWherePageState createState() => _IndexWherePageState();
}

class _IndexWherePageState extends State<IndexWherePage> {
  // List produk
  final List<Product> productList = [
    Product(id: '1', name: 'Product A'),
    Product(id: '2', name: 'Product B'),
    Product(id: '3', name: 'Product C'),
  ];

  String? selectedProductId;
  String searchResult = '';

  // Fungsi untuk mencari produk berdasarkan ID
  void searchProductById(String id) {
    int index = productList.indexWhere((product) => product.id == id);

    if (index != -1) {
      setState(() {
        searchResult = 'Product Found: ${productList[index].name}';
      });
    } else {
      setState(() {
        searchResult = 'Product Not Found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          hint: const Text('Select Product ID'),
          value: selectedProductId,
          items: ['1', '2', '3', '4'].map((String id) {
            return DropdownMenuItem<String>(
              value: id,
              child: Text('ID: $id'),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedProductId = newValue;
            });

            if (newValue != null) {
              searchProductById(newValue);
            }
          },
        ),
        const SizedBox(height: 20),
        Text(
          searchResult,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Product {
  final String id;
  final String name;

  Product({required this.id, required this.name});
}
