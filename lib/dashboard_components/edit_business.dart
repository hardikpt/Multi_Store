import 'package:flutter/material.dart';
import 'package:multi_score/widgets/AppBartWidgets.dart';

class EditBusiness extends StatelessWidget {
  const EditBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'EditBusiness',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
