abstract class CartSource {
  Future<Map<String, dynamic>> updateOrderDynamicProperties({
    required String orderId,
  });

  Future<Map<String, dynamic>> cartInfo();
}
