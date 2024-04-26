import 'package:flutter/material.dart';
import 'package:multi_score/main_screens/category.dart';
import 'package:multi_score/main_screens/dashboard.dart';
import 'package:multi_score/main_screens/home.dart';
import 'package:multi_score/main_screens/stores.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    HomeScreen(),
    CategoryScreen(),
    StoresScreen(),
    DashBoardScreen(),
    Center(
      child: Text('Upload'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Stores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'DashBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'Upload',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
