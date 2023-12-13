import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => Switch(
              value: _themeController.isDarkMode.value,
              onChanged: (value) {
                _themeController.toggleTheme();
              },
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.products.length,
                itemBuilder: (context, index) {
                  var product = cartController.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toString()}'),
                    trailing: IconButton(
                        onPressed: () {
                          cartController.addToCart(product);
                        },
                        icon: Icon(Icons.add_shopping_cart)),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(CartScreen());
                },
                child: Text('Go to cart'))
          ],
        ),
      ),
    );
  }
}

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
