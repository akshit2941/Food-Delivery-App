import 'package:flutter/material.dart';
import 'package:foodapp/models/restaurants.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
        top: 50,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank You For Your Order!"),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => Text(
                  restaurant.displayCartReceipt(),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text("Estimated delivery time is: 4:10 PM"),
          ],
        ),
      ),
    );
  }
}
