import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<String> sizeOptions = const ['S', 'M', 'L'];
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Details'),
        centerTitle: true,
        actions: [Icon(Icons.heart_broken_rounded), SizedBox(width: 20)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/coffeeTwo.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coffee One',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('Coffee One', style: TextStyle(fontSize: 12)),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            '4.8',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('(250)', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(Icons.music_note, color: AppColor.primaryColor),
                      Icon(
                        Icons.battery_2_bar_sharp,
                        color: AppColor.primaryColor,
                      ),
                      Icon(Icons.food_bank, color: AppColor.primaryColor),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    'Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    spacing: 10,
                    children: sizeOptions
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = e;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedSize == e
                                      ? AppColor.primaryColor
                                      : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    color: selectedSize == e
                                        ? AppColor.primaryColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price'),
                      Text(
                        '\$4.48',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(200, 40)),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColor.primaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
