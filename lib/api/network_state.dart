
sealed class NetworkState<T> {
  NetworkState();
}


class NetworkLoading<T> extends NetworkState<T> {
  NetworkLoading();
}
class NetworkSuccess<T> extends NetworkState<T> {
  final T data;
  NetworkSuccess(this.data);
}
class NetworkError<T> extends NetworkState<T> {
  final String msg;
  NetworkError(this.msg);
}

