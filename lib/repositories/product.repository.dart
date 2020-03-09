import 'package:dio/dio.dart';
import '../models/product_details.dart';
import '../models/product_list_item.dart';
import '../settings/settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/products";

    Response response = await Dio().get(url);

    return (response.data as List)
      .map((course) => ProductListItemModel.fromJson(course))
      .toList();
  }
}