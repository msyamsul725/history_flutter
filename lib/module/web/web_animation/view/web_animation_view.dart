import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core_package.dart';
import 'package:hyper_ui/module/constants/code_view_animation.dart';
import 'package:hyper_ui/module/web/web_animation/controller/web_animation_controller.dart';
import 'package:hyper_ui/module/web/web_animation/widget/animated_switcher.dart';
import 'package:hyper_ui/module/web/web_animation/widget/cart_animation.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:hyper_ui/shared/widget/card/card.dart';
import 'package:hyper_ui/shared/widget/responsive/q_responsive_view.dart';

class WebAnimationView extends StatefulWidget {
  const WebAnimationView({super.key});

  Widget build(context, WebAnimationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("WebAnimation"),
        actions: const [],
      ),
      body: QResponsiveView(
        children: [
          QCard(title: "Cart Animation", code: cartAnimation, children: const [
            SizedBox(
              height: 300,
              child: CartExample(
                title: 'cart',
              ),
            )
          ]),
          QCard(
            title: "Swither Animation",
            code: codeAnimatedSwicther,
            children: const [AnimatedSwitcherPage()],
          ),
        ],
      ),
    );
  }

  @override
  State<WebAnimationView> createState() => WebAnimationController();
}

class AppListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final Map item;
  final int index;
  final void Function(GlobalKey) onClick;

  AppListItem(
      {super.key,
      required this.onClick,
      required this.item,
      required this.index});
  @override
  Widget build(BuildContext context) {
    //  Container is mandatory. It can hold images or whatever you want
    Container mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.network(
        item['photo'],
        width: 60,
        height: 60,
      ),
    );

    return InkWell(
      onTap: () => onClick(widgetKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mandatoryContainer,
          const SizedBox(
            height: 4.0,
          ),
          Text(
            item["product_name"],
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            item["category"],
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            "\$${item["price"]}",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: primaryColor,
            ),
            itemSize: 16.0,
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          duration: (index + 1 * 600).ms,
        )
        .move(
          duration: (index + 1 * 600).ms,
        );
  }
}
