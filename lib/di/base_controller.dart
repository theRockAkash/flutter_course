/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// Base controller with lifecycle hooks
abstract class BaseController {
  /// Called immediately after creation
  void onInit() {}

  /// Called after first frame (safe for API calls)
  void onReady() {}

  /// Called when controller is disposed
  void onDispose() {}
}
