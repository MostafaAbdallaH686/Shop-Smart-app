import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/views/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';

class MainNavigation extends StatefulWidget {
  final int index;
  const MainNavigation({super.key, this.index = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;

  final List<Widget> _screens = [HomeScreen(), CartScreen()];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _currentIndex == 0 ? "ShopSmart" : "Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: _currentIndex == 0 ? Icon(Icons.menu) : SizedBox(),
        actions: [
          _currentIndex == 0
              ? IconButton(
                onPressed: () {
                  context.push('/nav/1');
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              )
              : SizedBox(),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.elevated,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
