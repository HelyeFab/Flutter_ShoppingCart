import 'package:flutter/material.dart';
import 'package:shopping_cart/components/bottom_nav_bar.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: B_Navbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            children: [
              DrawerHeader(
                    child: Image.asset(
                  'lib/assets/logo.png',
                  color: Colors.white,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left:15.0),
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left:15.0),
                      child: Text(
                        'Shopping Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(left:15.0),
                      child: Text(
                        'Favourites',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
            ],

          ),
           Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Padding(
                padding: EdgeInsets.only(left:15.0),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
