import 'package:flutter/material.dart';
import 'package:multi_score/widgets/AppBartWidgets.dart';

class SupplierOrders extends StatelessWidget {
  const SupplierOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'SupplierOrders',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
