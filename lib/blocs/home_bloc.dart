import '../models/category_model.dart';
import '../models/product_list_item.dart';
import '../repositories/category_repository.dart';
import '../repositories/product_repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRepo = new CategoryRepository();
  final productRepo = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryModel> categories;
  String selectedCategory = 'all';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepo.getAll()
      .then((data) {
        this.categories = data;
         notifyListeners();
      }); 
  }

  getProducts() {
    productRepo.getAll()
      .then((data) {
        this.products = data;
        notifyListeners();
      });
  }

  getProductsByCategory() {
    productRepo.getByCategory(selectedCategory)
      .then((data) {
        this.products = data;
        notifyListeners();
      });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}