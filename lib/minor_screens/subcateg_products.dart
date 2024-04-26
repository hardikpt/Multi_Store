import 'package:flutter/material.dart';
import 'package:multi_score/widgets/AppBartWidgets.dart';

class SubCategProducts extends StatelessWidget {
  final String mainCategName;
  final String subCategName;
  const SubCategProducts(
      {super.key, required this.subCategName, required this.mainCategName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
        title: AppBarTitle(title: subCategName),
      ),
      body: Center(
        child: Text(mainCategName),
      ),
    );
  }
}
