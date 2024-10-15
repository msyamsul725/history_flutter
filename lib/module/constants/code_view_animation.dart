String codeAnimatedSwicther = """
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
""";

String cartAnimation = """
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';

class CartExample extends StatefulWidget {
  const CartExample({super.key, required this.title});
  final String title;

  @override
  CartExampleState createState() => CartExampleState();
}

class CartExampleState extends State<CartExample> {
  // We can detect the location of the cart by this  GlobalKey<CartIconKey>
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: false,
          actions: [
            //  Adding 'clear-cart-button'
            IconButton(
              icon: const Icon(Icons.cleaning_services),
              onPressed: () {
                _cartQuantityItems = 0;
                cartKey.currentState!.runClearCartAnimation();
              },
            ),
            const SizedBox(width: 16),
            AddToCartIcon(
              key: cartKey,
              icon: const Icon(Icons.shopping_cart),
              badgeOptions: const BadgeOptions(
                active: true,
                backgroundColor: Colors.red,
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: ListView(
          children: List.generate(
            15,
            (index) => AppListItem(
              onClick: listClick,
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }
}

class AppListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final int index;
  final void Function(GlobalKey) onClick;

  AppListItem({super.key, required this.onClick, required this.index});
  @override
  Widget build(BuildContext context) {
    //  Container is mandatory. It can hold images or whatever you want
    Container mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.network(
        "https://cdn.jsdelivr.net/gh/omerbyrk/add_to_cart_animation/example/assets/apple.png",
        width: 60,
        height: 60,
      ),
    );

    return ListTile(
      onTap: () => onClick(widgetKey),
      leading: mandatoryContainer,
      title: Text(
        "Animated Apple Product Image \$index",
      ),
    );
  }
}

""";
