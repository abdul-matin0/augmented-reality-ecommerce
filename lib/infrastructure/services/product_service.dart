import 'package:halcera/infrastructure/models/dto/product_list_response.dart';
import 'package:halcera/infrastructure/services/api/api_base_service.dart';
import 'package:halcera/infrastructure/services/api/api_constant.dart';

/// API calls for Product services
class ProductService {
  final ApiBaseService _apiBaseService = ApiBaseService();

  /// fetch products
  Future<ProductListResponse> fetchProducts() async {
    try {
      var jsonResponse = await _apiBaseService.apiRequest(
          apiType: APIType.get, url: '${ApiConstants.getProductsEndpoint}/GetAll');

      ProductListResponse productListResponse = ProductListResponse.fromJson(jsonResponse);
      return productListResponse;
    } catch (e) {
      rethrow;
    }
  }


}
