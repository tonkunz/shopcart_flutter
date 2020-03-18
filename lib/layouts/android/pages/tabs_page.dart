import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/cart_bloc.dart';
import 'package:shopcart_bloc_provider/layouts/android/pages/cart_page.dart';
import 'home_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartBloc bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: [
          HomePage(),
          CartPage(),
          Container(color: Colors.green),
        ],     
      ),
      bottomNavigationBar: new TabBar(
        tabs: <Widget>[
          Tab(
            icon: new Icon(Icons.home),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    bloc.cart.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            icon: new Icon(Icons.perm_identity),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor
      ),
    );
  }
}