
// ✅ Can be instantiated
// ✅ Can be extended or implemented (inside library), subclasses must be base, final, or sealed
// ❌ Can't be extended/implemented outside of its library

final class ApiConfig {
  final String baseUrl;

  ApiConfig(this.baseUrl) {
    print("Configured API Values");
  }
}

base class HttpApiConfig implements ApiConfig {
  @override
  String get baseUrl => throw UnimplementedError();
}

base class RetrofitApiConfig extends ApiConfig {
  RetrofitApiConfig(super.baseUrl);
}
