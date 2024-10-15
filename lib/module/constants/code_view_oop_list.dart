String codeSummarizeText = """
//controller
  List sendTemplate = ["Apakah Stock Masih ada?", "Bisa dikirim sekarang?"];
  String getPreviewText(String item) {
    List<String> words = item.split(" ");
    return words.length > 2 ? "\${words[0]} \${words[1]}..." : item;
  }
// view
 Container(
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        child: Row(
                          children: List.generate(
                            controller.sendTemplate.length,
                            (index) {
                              var item = controller.sendTemplate[index];
                              bool selected = index == 0;

                              return Container(
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                child: Text(
                                  controller.getPreviewText(item),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
""";

String codeIndexWhere = """
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
        searchResult = 'Product Found: \${productList[index].name}';
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
              child: Text('ID: \$id'),
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

""";

String codeFirstWhere = """
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Produk'),
      ),
      body: Padding(
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
                  child: Text('ID: {product.id} - {product.name}'),
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
                            'Nama: {selectedProduct!.name}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Harga: Rp {selectedProduct!.price.toStringAsFixed(0)}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}

""";

String anywhere = """
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField untuk input pencarian
            TextField(
              onChanged: searchProduct,
              decoration: const InputDecoration(
                labelText: 'Cari Produk',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            // Menampilkan hasil pencarian dalam ListView
            Expanded(
              child: ListView.builder(
                itemCount: filteredListHistory.length,
                itemBuilder: (context, index) {
                  final order = filteredListHistory[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        'Order {index + 1}',
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
        ),
      ),
    );
  }
}

""";

String codeSortList = """
import 'package:flutter/material.dart';

class SortOrderPage extends StatefulWidget {
  const SortOrderPage({super.key});

  @override
  _SortOrderPageState createState() => _SortOrderPageState();
}

class _SortOrderPageState extends State<SortOrderPage> {
  List<Order> filteredListHistory = List.from(orders); // Copy dari orders
  String selectedSort = 'Terbaru'; // Default pilihan

  // Fungsi untuk melakukan sorting berdasarkan pilihan user
  void sortOrders(String sortType) {
    setState(() {
      selectedSort = sortType;

      // Urutkan data berdasarkan `createdAt`
      if (sortType == 'Terbaru') {
        filteredListHistory.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      } else if (sortType == 'Terlama') {
        filteredListHistory.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Dropdown untuk memilih jenis sorting
          DropdownButton<String>(
            value: selectedSort,
            items: ['Terbaru', 'Terlama']
                .map((sort) => DropdownMenuItem(
                      value: sort,
                      child: Text(sort),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) sortOrders(value);
            },
          ),
          const SizedBox(height: 20),
          // Menampilkan hasil sorting dalam ListView
          Expanded(
            child: ListView.builder(
              itemCount: filteredListHistory.length,
              itemBuilder: (context, index) {
                final order = filteredListHistory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(order.title),
                    subtitle: Text(
                      'Dibuat pada: {order.createdAt.toString().split(' ')[0]}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
""";
