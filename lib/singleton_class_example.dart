
class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    print("Returning same instance");
    return _instance;
  }

  Logger._internal(); // private named constructor

  void log(String message) {
    print("[LOG] $message");
  }
}

void main() {
  var l1 = Logger();
  var l2 = Logger();
  print(l1 == l2); // true
}


