import 'package:flutter/material.dart';
import 'package:widgets/reuse_widgets.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(context, 'Shop'),
      ],
    );
  }
}

