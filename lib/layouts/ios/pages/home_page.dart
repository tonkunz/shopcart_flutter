import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/home_bloc.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/category/category_list_widget.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/product/product_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              'Categorias',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 10),
            CategoryList(
              categories: bloc.categories
            ),
            SizedBox(height: 20),
            Text(
              'Mais Vendidos',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 10),
            ProductList(products: bloc.products),
          ],
        ),
      ),
    );
  }
}