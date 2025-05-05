abstract class CartSource {
  Future<Map<String, dynamic>> updateOrderDynamicProperties({
    required String orderId,
  });
}
