class ApiConstants {
  static String baseEndpoint = 'https://10.0.2.2:7063/api';
  static String accessToken = "";
  static int requestTimeOutDuration = 10;

  /// GetStorage UserPrefernce Key
  static const userPreferenceKey = 'UserPreference';

  // auth
  static String registrationEndpoint = '/auth/register';
  // products
  static String getProductsEndpoint = '/Customer/Products';
}
