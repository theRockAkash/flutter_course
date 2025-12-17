/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in
library;

//Who Talks to Whom (IMPORTANT)
//View
//  ↓
// ViewModel
//  ↓
// AuthRepository
//  ↓
// AuthApiSource
//  ↓
// ApiClient
//  ↓
// HTTP

/**
 *  Recommended MVVM + GetX Folder Structure (Feature-first MVVM)
 * lib/
    │
    ├── main.dart
    ├── app.dart
    │
    ├── routes/
    │   ├── app_pages.dart
    │   └── app_routes.dart
    │
    │
    ├── services/                      // App services
    │   ├── storage_service.dart
    │   └── auth_service.dart           // login session or user data manager
    │
    │
    ├── core/                          // App-wide shared stuff
    │   │
    │   ├── theme/
    │   │   └── theme.dart
    │   │
    │   ├── state/
    │   │   └── ui_state.dart          //sealed loading, success , error
    │   │
    │   ├── constants/
    │   │   ├── api_constants.dart
    │   │   ├── app_colors.dart
    │   │   └── app_strings.dart
    │   │
    │   ├── network/
    │   │   ├── api_client.dart        // get, post, put, delete methods
    │   │   └── api_response.dart     //CommonRes/BaseRes
    │   │
    │   ├── utils/
    │   │   ├── validators.dart
    │   │   └── extensions.dart
    │   │
    │   └── widgets/
    │       ├── app_button.dart
    │       └── app_text_field.dart
    │
    ├── data/                          // Data layer (shared)
    │   ├── models/
    │   │   ├── user_model.dart
    │   │   └── product_model.dart
    │   │
    │   ├── repositories/
    │   │   ├── auth_repository.dart
    │   │   └── product_repository.dart
    │   │
    │   └── sources (or providers)/
    │       ├── auth_api_source(or provider).dart
    │       └── product_api_source(or provider).dart
    │
    │
    ├── modules/                       // Feature-first MVVM (GetX)
    │
    │   ├── auth/
    │   │   ├── login/
    │   │   │   ├── login_view.dart
    │   │   │   ├── login_controller.dart      // ViewModel
    │   │   │   └── login_binding.dart
    │   │   │
    │   │   └── signup/
    │   │       ├── signup_view.dart
    │   │       ├── signup_controller.dart
    │   │       └── signup_binding.dart
    │   │
    │   ├── products/
    │   │   ├── product_list/
    │   │   │   ├── product_list_view.dart
    │   │   │   ├── product_list_controller.dart
    │   │   │   └── product_list_binding.dart
    │   │   │
    │   │   ├── product_detail/
    │   │   │   ├── product_detail_view.dart
    │   │   │   ├── product_detail_controller.dart
    │   │   │   └── product_detail_binding.dart
    │   │   │
    │   │   └── search/
    │   │       ├── search_view.dart
    │   │       ├── search_controller.dart
    │   │       └── search_binding.dart
    │   │
    │   └── cart/
    │       ├── cart_view.dart
    │       ├── cart_controller.dart
    │       └── cart_binding.dart1
    └──────────────────────────────────────────────
 */



/** Framework-Agnostic Pure MVVM Structure
 * lib/
    │
    ├── main.dart
    ├── app.dart
    │
    ├── routes/
    │   ├── app_pages.dart
    │   └── app_routes.dart
    │
    ├── core/                          // App-wide shared stuff
    │   ├── constants/
    │   │   ├── api_constants.dart
    │   │   ├── app_colors.dart
    │   │   └── app_strings.dart
    │   │
    │   ├── network/
    │   │   ├── api_client.dart
    │   │   └── api_response.dart
    │   │
    │   ├── utils/
    │   │   ├── validators.dart
    │   │   └── extensions.dart
    │   │
    │   └── widgets/
    │       ├── app_button.dart
    │       └── app_textfield.dart
    │
    ├── models/                        // MODEL (pure data)
    │   ├── user_model.dart
    │   └── product_model.dart
    │
    ├── services/                      // External services
    │   ├── api_client_service.dart
    │   ├── storage_service.dart
    │   └── auth_service.dart
    │
    ├── repositories/                  // Data access layer
    │   ├── auth_repository.dart
    │   └── product_repository.dart
    │
    ├── viewmodels/                    // VIEWMODEL (no framework)
    │
    │   ├── auth/
    │   │   ├── login_viewmodel.dart
    │   │   └── signup_viewmodel.dart
    │
    │   ├── products/
    │   │   ├── product_list_viewmodel.dart
    │   │   ├── product_detail_viewmodel.dart
    │   │   └── search_viewmodel.dart
    │
    │   └── cart/
    │       └── cart_viewmodel.dart
    │
    ├── views/                         // VIEW (UI only)
    │
    │   ├── auth/
    │   │   ├── login_view.dart
    │   │   └── signup_view.dart
    │   │
    │   ├── products/
    │   │   ├── product_list_view.dart
    │   │   ├── product_detail_view.dart
    │   │   └── search_view.dart
    │   │
    │   └── cart/
    │       └── cart_view.dart
    │
    └── di/                            // Dependency wiring (manual)
    └── injector.dart

 */
