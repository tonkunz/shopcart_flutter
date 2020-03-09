import 'package:dio/dio.dart';
import '../models/product_details.dart';
import '../models/product_list_item.dart';
import '../settings/settings.dart';

class ProductRepository {
  // Get all products
  Future<List<ProductListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/products";

    Response response = await Dio().get(url);

    return (response.data as List)
      .map((course) => ProductListItemModel.fromJson(course))
      .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}v1/categories/$category/products";

    Response response = await Dio().get(url);

    return (response.data as List)
      .map((course) => ProductListItemModel.fromJson(course))
      .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = "${Settings.apiUrl}v1/products/$tag";

    Response response = await Dio().get(url);

    return ProductDetailsModel.fromJson(response.data);
  }

}