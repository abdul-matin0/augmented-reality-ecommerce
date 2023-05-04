import 'package:agora_uikit/agora_uikit.dart';
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

  final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: 'e5aba4e7d7cc4052aade4d5d15fa2dd6',
          channelName: 'halvera',
          tempToken:
              '007eJxTYFj04DvDRx2lWN5fl5439e9sb5904XvD99QNycvmfllf7NOlwJBqmpiUaJJqnmKenGxiYGqUmJiSapJimmJompZolJJiFjs7OKUhkJEhvS2HlZEBAkF8doaMxJyy1KJEBgYABeok1w=='));
  var onCall = false.obs;

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
      update();
    }
  }

  Future initAgora() async {
    try {
      client.engine.leaveChannel();
      // ignore: empty_catches
    } catch (e) {}
    await client.initialize();
    onCall.value = true;
  }
}
