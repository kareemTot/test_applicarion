abstract class LoginSource {
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
    required String grantType,
    required String scope,
  });
}
