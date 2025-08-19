import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        minVerticalPadding: 16,
        dense: false,
        title: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          cartItem.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          "\$${cartItem.price.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.brown,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            context.push('/product/${cartItem.id}');
          },
          child: Container(
            height: screenHeight * .12,
            width: screenWidth * .18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(cartItem.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        trailing: SizedBox(
          width: screenWidth * .38,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: screenWidth * .1,
                height: screenHeight * .06,
                decoration: BoxDecoration(
                  color: AppColors.brown.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    cartController.decreaseQuantity(cartItem);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: AppColors.black,
                    size: screenWidth * .08,
                  ),
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '${cartItem.quantity}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                width: screenWidth * .1,
                height: screenHeight * .06,
                decoration: BoxDecoration(
                  color: AppColors.brown.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    cartController.increaseQuantity(cartItem);
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColors.black,
                    size: screenWidth * .08,
                  ),
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
