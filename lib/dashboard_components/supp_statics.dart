import 'package:flutter/material.dart';
import 'package:multi_score/widgets/AppBartWidgets.dart';

class StaticScreen extends StatelessWidget {
  const StaticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'Static',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
