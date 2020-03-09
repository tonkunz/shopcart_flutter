import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart_bloc_provider/blocs/home_bloc.dart';
import 'package:shopcart_bloc_provider/models/category_model.dart';
import 'package:shopcart_bloc_provider/settings/settings.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel item;

  CategoryCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.selectedCategory
          ? Theme.of(context).primaryColor.withOpacity(0.3)
          : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70)
        ),
      ),
      child: FlatButton(
        onPressed: () {
          bloc.changeCategory(item.tag);
        },
        child: Image.asset(
          "assets/categories/${Settings.theme}/${item.tag}.png"
        ),
      ),
    );
  }
}