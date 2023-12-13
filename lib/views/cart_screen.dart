import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cart.length,
                itemBuilder: (context, index) {
                  var product = cartController.cart[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toString()}'),
                    trailing: IconButton(
                        onPressed: () {
                          cartController.removeFromCart(index);
                        },
                        icon: Icon(Icons.remove_shopping_cart)),
                  );
                },
              ),
            ),
            Row(
              children: [
                Text('Total: \$${cartController.totalAmount}'),
                ElevatedButton(
                    onPressed: () {
                      cartController.checkout();
                    },
                    child: Text('Checkout'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
