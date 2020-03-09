import '../models/category_model.dart';
import '../models/product_list_item.dart';
import '../repositories/category_repository.dart';
import '../repositories/product_repository.dart';

class HomeBloc {
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
      .then((data) => this.categories = data);
  }

  getProducts() {
    productRepo.getAll()
      .then((data) => this.products = data);
  }

  getProductsByCategory() {
    productRepo.getByCategory(selectedCategory)
      .then((data) => this.products = data);
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
  }
}