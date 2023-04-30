import 'package:get/get.dart';
import 'package:halcera/infrastructure/helper/fetch_operation.dart';
import 'package:halcera/infrastructure/models/dto/product_list_response.dart';
import 'package:halcera/infrastructure/models/product.dart';
import 'package:halcera/infrastructure/services/product_service.dart';

/// Products controller
class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  final FetchOperation productListFetchOperation = FetchOperation();

  List<Product> listOfProducts = [];

  @override
  void onInit() {
    super.onInit();
    getListOfProducts();
  }

  /// get list of products
  Future<void> getListOfProducts() async {
    try {
      productListFetchOperation.isLoading = true;
      update();

      ProductListResponse productListResponse =
          await _productService.fetchProducts();
      listOfProducts = productListResponse.data ?? [];

      productListFetchOperation.fetchOperationErrorMessage = null;
    } catch (exception) {
      productListFetchOperation.fetchOperationErrorMessage =
          exception.toString();
    } finally {
      productListFetchOperation.isLoading = false;
      productListFetchOperation.fetchOperationErrorMessage = null;
      update();
    }
  }
}
