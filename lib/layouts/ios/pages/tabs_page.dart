import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopcart_bloc_provider/layouts/android/pages/home_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Carrinho'),
          )
        ],
      ),
      tabBuilder:  (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
                break;
              case 1:
                return Container(
                  color: Colors.red,
                );
                break;
              default:
                return Container(
                  color: Colors.green
                );
            }
          },
        );
      },
    );
  }
}
