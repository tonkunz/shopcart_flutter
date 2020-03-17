import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/cart_bloc.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/cart/cart_item_widget.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/loader_widget.dart';
import 'package:shopcart_bloc_provider/models/cart_item.dart';

class CartPage extends StatelessWidget {
  final price = new NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    CartBloc bloc = Provider.of<CartBloc>(context);
    List<CartItemModel> items = bloc.cart;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Loader(
                    object: bloc.cart,
                    callback: () {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            child: CartItem(
                              item: items[index],
                            ),
                            key: Key(items[index].id),
                            onDismissed: (direction) {
                              bloc.remove(items[index]);
                            },
                            background: Container(
                              color: Colors.red.withOpacity(0.1),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "R\$ ${price.format(bloc.total)}",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    FlatButton(
                      child: Text("Checkout"),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
