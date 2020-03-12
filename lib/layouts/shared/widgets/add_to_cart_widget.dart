import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/cart_bloc.dart';
import 'package:shopcart_bloc_provider/models/cart_item.dart';
import 'package:shopcart_bloc_provider/models/product_list_item.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  AddToCart({@required this.item});

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = Provider.of<CartBloc>(context);
    CartItemModel cartItem = new CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.add_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.add(cartItem);
            final snackBar = SnackBar(content: Text("${item.title} adicionado"));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Colors.red,
          child: Icon(Icons.remove_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.remove(cartItem);
            final snackBar = SnackBar(content: Text("${item.title} removido"));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}