import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [Text('Total Price :')],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
