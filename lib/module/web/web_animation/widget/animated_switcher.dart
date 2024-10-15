import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({super.key});

  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  // Variabel untuk menyimpan item yang sedang dibuka
  Item? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedItem == item;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                ListTile(
                  title: Text(item.title),
                  onTap: () {
                    setState(() {
                      // Jika item yang sama ditekan, sembunyikan; jika tidak, tunjukkan item tersebut
                      selectedItem = isSelected ? null : item;
                    });
                  },
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        sizeFactor: animation,
                        axisAlignment: 0.0,
                        child: child,
                      ),
                    );
                  },
                  child: isSelected
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          key: ValueKey(item.description),
                          child: Text(
                            item.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      : const SizedBox
                          .shrink(), // Jika tidak dipilih, tidak tampilkan apapun
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String title;
  final String description;

  Item({required this.title, required this.description});
}

final List<Item> items = [
  Item(title: 'Item 1', description: 'Detail dari Item 1'),
  Item(title: 'Item 2', description: 'Detail dari Item 2'),
  Item(title: 'Item 3', description: 'Detail dari Item 3'),
];
