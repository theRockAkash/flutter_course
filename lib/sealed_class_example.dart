// ✅ Can be instantiated if not abstract
// ✅ Can be extended (inside library only)
// ❌ Cannot be extended (outside library)
// ❌ Cannot be implemented (anywhere)


// Sealed main class
sealed class UiState<T> {
  const UiState();

  /// Factory helpers
  const factory UiState.error(String msg) = Error<T>;
  const factory UiState.loading() = Loading<T>;
  const factory UiState.success(T data) = Success<T>;
}

// Error state
class Error<T> extends UiState<T> {
  final String msg;
  const Error(this.msg);
}

// Loading state
class Loading<T> extends UiState<T> {
  const Loading();
}

// Success state
class Success<T> extends UiState<T> {
  final T data;
  const Success(this.data);
}

// Extension method for `when`
extension UiStateWhen<T> on UiState<T> {
  R when<R>({
    required R Function(String msg) error,
    required R Function() loading,
    required R Function(T data) success,
  }) {
    switch (this) {
      case Error(:var msg):
        return error(msg);
      case Loading():
        return loading();
      case Success(:var data):
        return success(data);
    }
  }
}
void main() {
  const UiState<String> state = UiState.error("All good!");

  //case 1 with switch
  switch (state) {
    case Error(:var msg):
      print("Error: $msg");

    case Loading():
      print("Loading...");

    case Success(:var data):
      print("Success with data: $data");
  }
  //case 2 with when
  final message = state.when(
    error: (msg) => "Error: $msg",
    loading: () => "Loading...",
    success: (data) => "Success: $data",
  );
  print(message);

  // Creating other states
  const err = UiState.error("Something went wrong");
  const error = Error("Something went wrong");
  const load = UiState.loading();
  const loading = Loading();
  const ok = UiState.success("Done!");
  const success = Success("Done!");
}



//Example 2
sealed class Shape {
  const Shape();

  factory Shape.square(double size) = Square;
  factory Shape.circle(double radius) = Circle;
}

class Square extends Shape {
  final double size;
  const Square(this.size);
}

class Circle extends Shape {
  final double radius;
  const Circle(this.radius);
}

void main2() {
  Shape s1 = Shape.square(5);
  Shape s2 = Shape.circle(2);
  print(s1); // Instance of 'Square'
  print(s2); // Instance of 'Circle'
}