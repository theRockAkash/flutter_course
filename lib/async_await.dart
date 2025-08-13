/// Async & Await Examples
library;

/// Simulating API call and return data
Future<int> fetchData() async {
  //add some logic to fetch local database
  //return 3;
  await Future.delayed(Duration(seconds: 2));
  print('Data fetched');
  return 1;
}

/// Simulating API call and return data with callback function
void fetchDataWithCallBack(Function(int) callback) async {
  await Future.delayed(Duration(seconds: 2));
  print('Data fetched');
  callback.call(1);
  await Future.delayed(Duration(seconds: 2));
  callback.call(1);
}

/// Try Catch Exception handling Sample Code
Future<void> tryCatch() async {
  try {
    throw Exception('Error occurred');
  } catch (e) {
    print(e.toString());
  } finally {
    print('Cleanup');
  }
}

void main() {
  //Case 1
  callAPI(); // not recommended

  //Case 2
  callAPIWithAwait(); //standard (executed in sequence)

  //Case 3
  callAPIWithThen(); //standard (executed in parallel)

  //Case 4
  callAPIWithCallBack(); //advanced (executed in parallel)

  //With Try catch finally
  //Case 5
  callAPIWithTryCatch(); // not recommended, finally won't work

  //Case 6
  callAPIWithAwaitTryCatch(); //standard (executed in sequence, finally works)

  //Case 7
  callAPIWithThenTryCatch(); //Finally wont work

  //Case 8
  callAPIWithCallbackTryCatch(); // Finally wont work
}

void callAPI() {
  print("=========>  API Call Stated");
  fetchData();
  print("=========>  API Call Ended");
}

Future<void> callAPIWithAwait() async {
  print("=========>  API Call Stated");
  final data = await fetchData();
  print("Result : $data");
  print("=========>  API Call Ended");
}

void callAPIWithThen() {
  print("=========>  API Call Stated 1");
  fetchData().then((data) {
    print("Result : $data");
  });
  print("=========>  API Call Stated 2 ");
  fetchData().then((data) {
    print("Result : $data");
  });

  print("=========>  API Call Ended");
}

void callAPIWithCallBack() {
  print("=========>  API Call Stated");
  fetchDataWithCallBack((data) {
    print("Result : $data");
  });
  fetchDataWithCallBack((data) {
    print("Result : $data");
  });
  print("=========>  API Call Ended");
}

void callAPIWithTryCatch() {
  try {
    print("=========>  API Call Stated");
    fetchData();
    print("=========>  API Call Ended");
  } catch (e) {
    print(e.toString());
  } finally {
    print("=========>  finally");
  }
}

Future<void> callAPIWithAwaitTryCatch() async {
  try {
    print("=========>  API Call Stated");
    final data = await fetchData();
    print("Result : $data");
    print("=========>  API Call Ended");
  } catch (e) {
    print(e.toString());
  } finally {
    print("=========>  finally"); // recommended
  }
}

void callAPIWithThenTryCatch() {
  try {
    isLoading = true;
    print("=========>  API Call Stated");
    fetchData().then((data) {
      print("Result : $data");
      print("=========>  clean"); // recommended
      isLoading = false; // recommended
    });
    print("=========>  API Call Ended");
  } catch (e) {
    print(e.toString());
    print("=========>  clean"); // recommended
    isLoading = false; // recommended
  } finally {
    isLoading = false; // not recommended
    print("=========>  finally"); // not recommended
  }
}

bool isLoading = false;

void callAPIWithCallbackTryCatch() {
  try {
    isLoading = true;
    print("=========>  API Call Stated");
    fetchDataWithCallBack((data) {
      print("Result : $data");
      print("=========>  clean"); // recommended
      isLoading = false; // recommended
    });
    print("=========>  API Call Ended");
  } catch (e) {
    print(e.toString());
    print("=========>  clean"); // recommended
    isLoading = false; // recommended
  } finally {
    isLoading = false; // not recommended
    print("=========>  finally"); // not recommended
  }
}
