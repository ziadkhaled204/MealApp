🍽️ Meal App

A Flutter meal application that allows users to browse, search, and filter meals based on different categories and preferences. This project utilizes Riverpod for state management, ensuring a clean and maintainable architecture.

✨ Features

📖 Browse a variety of meals

🔍 Search for meals by name

🎛️ Filter meals based on dietary preferences

📜 View detailed meal recipes and ingredients

⭐ Add meals to favorites

🛠️ Tech Stack

🚀 Flutter - UI framework for cross-platform mobile development

💙 Dart - Programming language

🌿 Riverpod - State management solution for predictable and scalable state handling

❄️ Freezed - Data classes and union types for immutability

📦 Installation

git clone https://github.com/yourusername/meal-app.git
cd meal-app
flutter pub get
flutter run

🔗 State Management with Riverpod

This project leverages Riverpod for state management, ensuring a reactive and scalable architecture. The following Riverpod providers are used:

🟢 StateProvider for managing UI state like filters

🔵 NotifierProvider for managing complex state such as favorite meals

Example usage:

final favoriteMealsProvider = NotifierProvider<FavoriteMealsNotifier, List<Meal>>(() {
  return FavoriteMealsNotifier();
});

📂 Folder Structure

lib/
│── main.dart
├── providers/
├── models/
├── data/
├── widgets/

🤝 Contributing

Contributions are welcome! Feel free to open issues and submit pull requests.

Made with ❤️ by ziad khaled

