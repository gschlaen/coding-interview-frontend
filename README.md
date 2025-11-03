# Challenge El Dorado Exchange Application

A Flutter application implementing a cryptocurrency quote interface, built using a feature-first architecture with a clear separation of concerns and modern Flutter best practices.

## Architecture Overview

This application follows a feature-first layered architecture, promoting separation of concerns and scalability.

### Layer Structure

```
┌────────────────────────────────────────────────────────────────┐
│                    Presentation Layer                          │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │   Exchange      │  │   App Theme     │  │   Common        │ │
│  │   Feature       │  │   & Styling     │  │   Widgets       │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
├────────────────────────────────────────────────────────────────┤
│                    Domain Layer                                │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │   Currency      │  │ Recommendation  │  │   Exchange      │ │
│  │   Models        │  │   Model         │  │   State         │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
├────────────────────────────────────────────────────────────────┤
│                      Data Layer                                │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │   API Client    │  │   Quote         │  │   Exceptions    │ │
│  │   (http)        │  │   Repository    │  │   & Handling    │ │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘ │
└────────────────────────────────────────────────────────────────┘
```

### Project Structure

The application is organized by features inside the `lib/src` directory:

- **`lib/src/features/exchange/`**: Contains the core quote feature, including its presentation, domain, and data layers.
- **`lib/src/core/`**: Core functionalities like the API client.
- **`lib/src/common_widgets/`**: Reusable UI components.
- **`lib/src/Theme/`**: Application-wide theming and styling.
- **`lib/src/constants/`**: Application constants like sizes and gaps.
- **`lib/src/exceptions/`**: Custom exception classes.

## Technical Stack & Dependencies

### Core Dependencies

| Package | Purpose | Technical Decision |
|---|---|---|
| `flutter_riverpod` | State management | **Riverpod** for a reactive and declarative state management approach, with compile-time safety. |
| `http` | Network layer | **Lightweight HTTP client** for making API calls to the quote service. |
| `shimmer` | Loading states | **Progressive loading UX** with skeleton screens for a better user experience. |
| `flutter_lints` | Code quality | **Official Flutter linting rules** for consistent code style and best practices. |

### Architecture Patterns

#### 1. **Riverpod State Management**
```dart
final exchangeCardControllerProvider =
    NotifierProvider<ExchangeCardController, ExchangeCardState>(
      ExchangeCardController.new,
    );

class ExchangeCardController extends Notifier<ExchangeCardState> {
  // ✅ Debounced API calls (500ms)
  // ✅ Immutable state objects
  // ✅ Business logic separation
}
```

#### 2. **Repository Pattern**
```dart
class QuoteRepository {
  Future<Recommendation?> getRecommendations({
    required int type,
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amount,
    required String amountCurrencyId,
  });
}
```

#### 3. **Dependency Injection**
- **Riverpod Providers** for dependency injection throughout the app.
- **Provider** for services like `ApiClient` and `QuoteRepository`.
- **NotifierProvider** for state management controllers.

## Key Technical Features

### State Management

**ExchangeCardState** with Riverpod for UI rendering:
- ✅ **Immutable state objects** using `copyWith`.
- ✅ **Reactive UI updates** based on state changes.
- ✅ **Debounced user input** for API efficiency using `Timer`.

### Error Handling Strategy

**Type-safe error handling** with custom exceptions:
```dart
sealed class AppException implements Exception {
  AppException(this.message, [this.statusCode]);
  final String message;
  int? statusCode;
}

class NoDataException extends AppException {
  NoDataException() : super('No recommendation data found');
}
```

### Performance Optimizations

- **Debounced API calls** (500ms delay) to prevent excessive requests.
- **Efficient state updates** using Riverpod's selective rebuilding.
- **Shimmer loading states** for better perceived performance.

## Feature Implementation

### Core Features
- **Quote Interface** with real-time updates.
- **Currency Exchange Direction** switching (Fiat-to-Crypto / Crypto-to-Fiat).
- **Multi-currency Support** (Fiat ⟷ Crypto).
- **Responsive Design** optimized for web.
- **Light Theme**.

### UI/UX Highlights
- **Progressive Loading States** with shimmer effects.
- **Intuitive Currency Selection** with a bottom sheet.
- **Smooth Animations** for currency switching.
- **Clean and modern UI**.

## Testing & Quality Assurance

### Unit Testing
- **QuoteRepository:** Unit tests cover successful data fetching, no data scenarios, and API failures.
- **ExchangeCardController:** Unit tests verify state management logic, currency swapping, and amount updates.

### Code Quality
- **Full null safety** compliance
- **Comprehensive error handling**
- **Clean architecture** with layer separation
- **Efficient state management** with minimal rebuilds
