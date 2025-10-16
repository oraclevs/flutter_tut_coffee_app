import 'package:coffee_shop/screens/detailsScreen.dart';
import 'package:coffee_shop/screens/home_index.dart';
import 'package:coffee_shop/screens/orders.dart';
import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class PlaceHolderClass extends StatelessWidget {
  final String title;
  const PlaceHolderClass({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}

const List<Widget> screens = [
  HomeIndex(),
  DetailsScreen(),
  OrdersScreen(),
  PlaceHolderClass(title: 'Map'),
];
int _currentIndex = 0;

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            activeIcon: Icon(Icons.home, color: AppColor.primaryColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heat_pump_rounded, color: Colors.black),
            activeIcon: Icon(
              Icons.heat_pump_rounded,
              color: AppColor.primaryColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded, color: Colors.black),
            activeIcon: Icon(Icons.shopping_bag, color: AppColor.primaryColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            activeIcon: Icon(Icons.notifications, color: AppColor.primaryColor),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
