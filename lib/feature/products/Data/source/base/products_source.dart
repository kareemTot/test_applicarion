abstract class ProductsSource {
  Future<Map<String, dynamic>> getProductDetails({required String productId});
}
