/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in

class ApiResponse<T> {
  final T? data;
  final String? error;
  final int? statusCode;

  ApiResponse._({this.data, this.error, this.statusCode});

  factory ApiResponse.success(T data) {
    return ApiResponse._(data: data);
  }

  factory ApiResponse.error(int code, String message) {
    return ApiResponse._(
      statusCode: code,
      error: message,
    );
  }

  bool get isSuccess => error == null;
}
