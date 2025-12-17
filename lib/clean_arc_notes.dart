/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in
library;

//CLEAN ARCHITECTURE RULES (NON-NEGOTIABLE)
// 1️⃣ Dependency Rule
// Presentation → Domain ← Data
//
//
// Domain depends on nothing
//
// Data depends on Domain
//
// Presentation depends on Domain
//
// Data and Presentation never depend on each other
//
// 2️⃣ Domain Layer Rules
//
// ✔ No Flutter
// ✔ No HTTP
// ✔ No JSON
// ✔ No Firebase
// ✔ Pure Dart only
//
// 3️⃣ Data Layer Rules
//
// ✔ Implements domain contracts
// ✔ Converts DTOs ↔ Entities
// ✔ Handles API / DB / Cache
//
// 4️⃣ Presentation Layer Rules
//
// ✔ Widgets
// ✔ State management (Bloc / Cubit / Riverpod / GetX)
// ✔ Talks ONLY to UseCases
//
// 🔁 Example Flow (Login)
// LoginPage (UI)
//    ↓
// AuthBloc / Controller
//    ↓
// LoginUseCase
//    ↓
// AuthRepository (abstract)
//    ↓
// AuthRepositoryImpl
//    ↓
// AuthRemoteDatasource
//    ↓
// HTTP / Firebase / DB

/**
 *  Clean Architecture Folder Structure (Flutter)
 * lib/
    ├── main.dart
    ├── app.dart
    │
    ├── core/                           // App-wide shared resources
    │   ├── constants/
    │   │   ├── api_constants.dart
    │   │   ├── app_colors.dart
    │   │   └── app_strings.dart
    │   │
    │   ├── usecase/
    │   │   └── usecase.dart
    │   │
    │   │
    │   ├── network/
    │   │   ├── api_client.dart
    │   │   └── api_response.dart
    │   │
    │   ├── utils/
    │   │   ├── validators.dart
    │   │   └── extensions.dart
    │   │
    │   ├── theme/
    │   │   └── theme.dart
    │   │
    │   └── widgets/
    │       ├── app_button.dart
    │       └── app_textfield.dart
    │
    ├── data/                           // Data layer (outer layer)
    │   ├── models/                     // JSON <-> Dart classes
    │   │   ├── user_model.dart
    │   │   └── product_model.dart
    │   │
    │   ├── sources/                    // Remote / Local sources
    │   │   ├── auth_api_source.dart
    │   │   └── product_api_source.dart
    │   │
    │   └── repositories/               // Repository implementations
    │       ├── auth_repository_impl.dart
    │       └── product_repository_impl.dart
    │
    ├── domain/                         // Business layer (inner layer)
    │   ├── entities/                   // Pure business objects
    │   │   ├── user.dart
    │   │   └── product.dart
    │   │
    │   ├── repositories/                 // ABSTRACT contracts
    │   │   ├── auth_repository.dart
    │   │   └── product_repository.dart
    │   │
    │   └── usecases/                   // Business rules / operations
    │       ├── login_usecase.dart
    │       ├── signup_usecase.dart
    │       └── get_products_usecase.dart
    │
    ├── presentation/                    // Presentation layer
    │   ├── viewmodels/                  // MVVM ViewModels
    │   │   ├── auth/
    │   │   │   ├── login_viewmodel.dart
    │   │   │   └── signup_viewmodel.dart
    │   │   ├── products/
    │   │   │   ├── product_list_viewmodel.dart
    │   │   │   └── product_detail_viewmodel.dart
    │   │   └── cart/
    │   │       └── cart_viewmodel.dart
    │   │
    │   ├── views/                       // Flutter UI Widgets
    │   │   ├── auth/
    │   │   │   ├── login_view.dart
    │   │   │   └── signup_view.dart
    │   │   ├── products/
    │   │   │   ├── product_list_view.dart
    │   │   │   └── product_detail_view.dart
    │   │   └── cart/
    │   │       └── cart_view.dart
    │   │
    │   └── widgets/                     // Feature-specific UI components
    │       └── product_card.dart
    │
    ├── services/                        // App-wide services
    │   ├── auth_service.dart
    │   └── storage_service.dart
    │
    ├── routes/
    │   ├── app_pages.dart
    │   └── app_routes.dart
    │
    └── di/
    └── injector.dart                // Dependency injection

 */

