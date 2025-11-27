# Phase 1 Technical Specification: Foundation & Auth

**Goal:** Initialize the Flutter project, set up the architecture, and implement robust authentication.

## 1. Project Structure (Feature-First)
We will use a **Feature-First** directory structure to ensure scalability as the app grows to 6+ phases.

```
lib/
├── app/
│   ├── app.dart             # App entry point (MaterialApp)
│   ├── theme/               # Theme data (Light/Dark)
│   └── router/              # GoRouter configuration
├── core/
│   ├── constants/           # API endpoints, assets strings
│   ├── network/             # Dio client, Interceptors (Auth)
│   ├── storage/             # Secure Storage & SharedPrefs wrappers
│   ├── utils/               # Validators, Formatters
│   └── widgets/             # Common widgets (Buttons, Inputs, Loaders)
├── features/
│   ├── auth/
│   │   ├── data/            # Repositories, DTOs, Data Sources
│   │   ├── domain/          # Entities, Failures
│   │   └── presentation/    # Screens (Login, Register), Providers (Riverpod)
│   ├── home/
│   │   └── presentation/    # Home Screen
│   └── profile/
│       └── presentation/    # Profile Screen
└── main.dart
```

## 2. Key Dependencies (`pubspec.yaml`)

### Core
*   `flutter_riverpod`: ^2.5.0 (State Management)
*   `riverpod_annotation`: ^2.3.0 (Code generation for providers)
*   `go_router`: ^13.0.0 (Navigation)
*   `freezed_annotation`: ^2.4.0 (Immutable data classes)
*   `json_annotation`: ^4.8.0 (JSON serialization)

### Networking & Data
*   `dio`: ^5.4.0 (HTTP Client)
*   `flutter_secure_storage`: ^9.0.0 (Storing JWT tokens)
*   `shared_preferences`: ^2.2.0 (Simple settings)

### UI/UX
*   `google_fonts`: ^6.1.0
*   `flutter_svg`: ^2.0.0
*   `toastification`: ^2.0.0 (In-app notifications)

### Dev Dependencies
*   `build_runner`: ^2.4.0
*   `riverpod_generator`: ^2.4.0
*   `freezed`: ^2.4.0
*   `json_serializable`: ^6.7.0

## 3. Architecture Pattern
We will follow **Clean Architecture** principles adapted for Flutter (Riverpod + Repository Pattern).

*   **Data Layer:** `Dio` calls, JSON parsing (`fromJson`), caching.
*   **Domain Layer:** Pure Dart classes (Entities), Repository Interfaces.
*   **Presentation Layer:** `ConsumerWidget`s, `AsyncNotifier` providers for state.

## 4. Authentication Implementation Details

### API Integration
*   **Login:** `POST /auth/login`
    *   Request: `{ "emailOrMobile": "...", "password": "..." }`
    *   Response: `{ "data": { "token": "...", "user": { ... } } }`
    *   Action: Store `token` in SecureStorage. Store `user` in Riverpod state.
*   **Register:** `POST /auth/register`
    *   Handle department selection if applicable (though mostly for internal users, we will focus on "Buyer" registration flow if not specified, or generic user).
*   **Me:** `GET /auth/me`
    *   Called on app startup to validate token and hydrate user state.

### State Management (Riverpod)
*   `authRepositoryProvider`: Provides access to API methods.
*   `authStateProvider`: An `AsyncNotifier<User?>`.
    *   `build()`: Checks SecureStorage for token. If found, calls `/auth/me`.
    *   `login()`: Calls API, updates state, saves token.
    *   `logout()`: Clears state and token.

## 5. Next Steps
1.  Generate the `pubspec.yaml`.
2.  Create the `Dio` network client with an Interceptor that adds the `Authorization: Bearer <token>` header.
3.  Implement the `AuthRepository`.
4.  Build the Login Screen.
