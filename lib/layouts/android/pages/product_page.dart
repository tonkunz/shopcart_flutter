import 'package:flutter/material.dart';
import 'package:shopcart_bloc_provider/layouts/shared/widgets/progress_indicator_widget.dart';
import 'package:shopcart_bloc_provider/models/product_details.dart';
import 'package:shopcart_bloc_provider/repositories/product_repository.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _repository = new ProductRepository();

  ProductPage({@required this.tag});

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            width: 200,
            child: Image.network(product.images[index]),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.get(tag),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Aguardando....');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text("Erro: ${snapshot.error}"),
              );
          return content(product);
        }

        return null;
      },
    );
  }
}