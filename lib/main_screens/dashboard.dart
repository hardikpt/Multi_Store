import 'package:flutter/material.dart';
import 'package:multi_score/dashboard_components/edit_business.dart';
import 'package:multi_score/dashboard_components/manage_products.dart';
import 'package:multi_score/dashboard_components/my_store.dart';
import 'package:multi_score/dashboard_components/supp_balance.dart';
import 'package:multi_score/dashboard_components/supp_statics.dart';
import 'package:multi_score/dashboard_components/suppliers_order.dart';
import 'package:multi_score/widgets/AppBartWidgets.dart';

List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
];

List<IconData> icons = [
  Icons.store,
  Icons.shopify_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];

List<Widget> pages = const [
  MyStore(),
  SupplierOrders(),
  EditBusiness(),
  ManageProducts(),
  BalanceScreen(),
  StaticScreen()
];

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'Dashboard',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/welcome_screen');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => pages[index]));
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.grey.shade300,
                color: Colors.white.withOpacity(0.9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      label[index].toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontFamily: 'Acme'),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
