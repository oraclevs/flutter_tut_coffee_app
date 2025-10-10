import 'package:coffee_shop/theme/colors.dart';
import 'package:coffee_shop/widget/widget.dart';
import 'package:flutter/material.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({super.key});

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  final List<String> coffeeTypes = [
    'All Coffee',
    'Machiota',
    'Latte',
    'Black',
    'American',
    'Nigeria',
  ];
  String selectedCoffeeType = 'All Coffee';
  final List<Map<String, dynamic>> data = [
    {
      'image': 'Assets/Images/coffeeOne.png',
      'title': 'coffee 1',
      'price': 4.43,
    },
    {
      'image': 'Assets/Images/coffeeFive.png',
      'title': 'coffee 2',
      'price': 3.43,
    },
    {
      'image': 'Assets/Images/coffeeThree.png',
      'title': 'coffee 3',
      'price': 3.43,
    },
    {
      'image': 'Assets/Images/coffeeFour.png',
      'title': 'coffee 3',
      'price': 24.43,
    },
    {
      'image': 'Assets/Images/coffeeFive.png',
      'title': 'coffee 3',
      'price': 41.43,
    },
    {
      'image': 'Assets/Images/coffeeSix.png',
      'title': 'coffee 3',
      'price': 14.42,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 360,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  color: AppColor.onPrimaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          color: AppColor.onSecondaryColor,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Mr Richmond, Itachi',
                            style: TextStyle(
                              color: AppColor.onSecondaryColor,
                              fontSize: 19,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: AppColor.onSecondaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        spacing: 20,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 40,
                            child: SearchBar(
                              leading: Icon(Icons.search),
                              hintText: 'Search Coffee',
                              backgroundColor: WidgetStatePropertyAll(
                                AppColor.secondaryColor,
                              ),
                              elevation: WidgetStatePropertyAll(0),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.sort,
                              color: AppColor.onSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 500,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 70),
                        SizedBox(
                          height: 40,
                          width: 360,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: coffeeTypes
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCoffeeType = e;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: e == selectedCoffeeType
                                            ? AppColor.primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          color: e == selectedCoffeeType
                                              ? AppColor.onSecondaryColor
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 270,
                          width: 340,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 50,
                                // runSpacing: 10,
                                children: data
                                    .map(
                                      (e) => coffeeCard(
                                        imageUrl: e['image'],
                                        price: e['price'].toString(),
                                        company: 'Regina',
                                        title: e['title'],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 170,
            left: 30,
            child: Container(
              height: 150,
              width: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('Assets/Images/coffeeSeven.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Promo',
                      style: TextStyle(
                        color: AppColor.onSecondaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'Buy one get\nOne FREE',
                    style: TextStyle(
                      color: AppColor.onSecondaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
