abstract class CartSource {
  Future<Map<String, dynamic>> updateOrderDynamicProperties({
    required String orderId,
  });

  Future<Map<String, dynamic>> cartInfo();
  Future<Map<String, dynamic>> onlinePayment({required String orderId});
  Future<Map<String, dynamic>> createOrder({required String cartId});
  Future<Map<String, dynamic>> updateOrderPayment({
    required String orderId,
    required double amount,
  });
}
