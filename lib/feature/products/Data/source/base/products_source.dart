abstract class ProductsSource {
  Future<Map<String, dynamic>> getProductDetails({required String productId});
  Future<Map<String, dynamic>> addItemToCart({
    required String productId,
    String? fullfilmentCenterId,
  });
}
