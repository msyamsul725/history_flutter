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
    return SizedBox(
      height: 350,
      child: Padding(
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
                        'Dibuat pada: ${order.createdAt.toString().split(' ')[0]}',
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

class Order {
  final String title;
  final DateTime createdAt; // Tanggal dibuatnya order

  Order({required this.title, required this.createdAt});
}

final List<Order> orders = [
  Order(title: 'Order A', createdAt: DateTime(2024, 10, 12)),
  Order(title: 'Order B', createdAt: DateTime(2024, 10, 10)),
  Order(title: 'Order C', createdAt: DateTime(2024, 10, 14)),
];
