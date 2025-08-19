import 'package:flutter/material.dart';
import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/views/widgets/cart_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        if (cartController.cartItems.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/empty.json', height: 200, width: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'There is no Item in Cart, Please Discover and return here after add items',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cartItems[index];
                    return CartItemWidget(cartItem: cartItem);
                  },
                ),
              ),
              ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Subtotal : '),
                        Text('\$${cartController.subtotal.toStringAsFixed(2)}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Tax : ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.brown,
                          ),
                        ),
                        Text(
                          '\$${cartController.tax.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Text(
                  '\$${cartController.total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return Center(
                          child: Lottie.asset(
                            "assets/lottie/aW4ovttY1S.json",
                            width: screenWidth * .5,
                            height: screenHeight * .5,
                            repeat: false,
                            onLoaded: (composition) {
                              Future.delayed(composition.duration, () {
                                Navigator.of(
                                  context,
                                ).pop(); // Close dialog first

                                cartController.clearCart();
                                context.go('/nav/0');
                              });
                            },
                          ),
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
