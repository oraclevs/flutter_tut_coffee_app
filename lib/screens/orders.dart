import 'dart:convert';

import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isDeliver = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Text('Order'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Container(
                height: 50,
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        isDeliver = true;
                        print('>>>>>>>>delived');
                      }),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: isDeliver
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Deliver",
                            style: TextStyle(
                              fontSize: 22,
                              color: isDeliver ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        isDeliver = false;
                        print('>>>>>>>>pink up');
                      }),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: isDeliver
                              ? Colors.transparent
                              : AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Pick Up",
                            style: TextStyle(
                              fontSize: 22,
                              color: !isDeliver ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isDeliver ? Deliver() : PickUp(),
            ],
          ),
        ),
      ),
    );
  }
}

class Deliver extends StatefulWidget {
  const Deliver({super.key});

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  int orderCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6),
        Text(
          'Jl. Kpg Sutoyo',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 8),
        Row(
          spacing: 30,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Row(
                spacing: 10,
                children: [Icon(Icons.edit), Text('Edit Address')],
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Row(
                spacing: 10,
                children: [Icon(Icons.note_add), Text('Add Note')],
              ),
            ),
          ],
        ),

        SizedBox(height: 20),
        Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/Images/coffeeTwo.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'Coffee 1',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Black'),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (orderCount > 1) {
                      orderCount--;
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  orderCount.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      orderCount++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            height: 60,
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.black.withAlpha(70)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.settings),
                    Text(
                      '1 Discount is Applies',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
              child: ListTile(
                title: Text(
                  'Price',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                trailing: Text(
                  '\$4.44',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: ListTile(
                title: Text(
                  'Delivery Fee',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                trailing: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    children: [
                      TextSpan(
                        text: '\$4.44',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      TextSpan(text: utf8.decode([32, 32, 32])),
                      TextSpan(
                        text: '\$4.44',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 30,
          child: ListTile(
            leading: Icon(Icons.wallet, color: AppColor.primaryColor),
            title: Text(
              'Cash/Wallet',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '\$ 5.43',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(Icons.arrow_drop_down, size: 30),
          ),
        ),
        SizedBox(height: 50),
        Center(
          child: SizedBox(
            width: 300,
            child: FilledButton(
              onPressed: () {},
              child: Text('Order'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PickUp extends StatelessWidget {
  const PickUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Pickup'));
  }
}
