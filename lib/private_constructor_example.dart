

class MyClass {
  // Private constructor — nobody outside this file can call it
  MyClass._();


}

//Private class, can be instantiated in this file only
class _PrivateClass{

}


void main() {
  var obj1 = MyClass._();
 var obj2= _PrivateClass();

}

//Example of sealed class with private subclasses
sealed class UiState<T> {
  const UiState._(); // private base constructor

  factory UiState.error(String msg) => _Error<T>(msg);
  factory UiState.loading() => _Loading<T>();
  factory UiState.success(T data) => _Success<T>(data);
}

// Private subclasses
class _Error<T> extends UiState<T> {
  final String msg;
  const _Error(this.msg) : super._();
}

class _Loading<T> extends UiState<T> {
  const _Loading() : super._();
}

class _Success<T> extends UiState<T> {
  final T data;
  const _Success(this.data) : super._();
}
void main2() {
    UiState<String> state = UiState.success("All good!");

  // Creating other states
    final err = UiState.error("Something went wrong");
  //  final error = Error("Something went wrong");  //wont work
    final load = UiState.loading();
  //  final loading = Loading();                    //wont work
    final ok = UiState.success("Done!");
   // final success = Success("Done!");             //wont work
}