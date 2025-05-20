# ✅ TaskManager

TaskManager is a Flutter-based task management app designed to help users efficiently add, delete, update, and complete tasks. It follows a clean **MVVM architecture** and uses `Provider` for state management. The app persists user data using **SharedPreferences** and includes detailed task functionality via a separate screen.

---

## 🚀 Features

- ✅ Clean and scalable MVVM architecture
- ✅ Add, delete, and complete tasks
- ✅ Add and edit detailed descriptions to individual tasks
- ✅ State persistence using SharedPreferences
- ✅ Provider for efficient state management
- ✅ Inline task validation (e.g., cannot add task without a title)
- ✅ Task preview with subtitle (first 3 words only)
- ✅ Rounded tile UI with spacing between tasks

---

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: MVVM
- **State Management**: Provider
- **Data Persistence**: SharedPreferences
- **Unique ID Generator**: uuid (pub.dev)

---

## 📁 Project Structure
<pre> ``` lib/ ├── models/ # Data models ├── views/ # UI screens ├── viewmodels/ # Business logic and state management ├── data/ # API calls and network logic ├── res/ # Reusable UI components ├── utils/ # Helper functions/constants └── main.dart # Entry point ``` </pre>


---

## 🎥 Video Demo

Check out the demo of **FilmyINFO** on LinkedIn:

🔗 [Watch Demo on LinkedIn](https://www.linkedin.com/posts/muhammad-daniyal-b11942366_flutter-dart-mobiledevelopment-activity-7330601807993339905-YQnP?utm_source=share&utm_medium=member_android&rcm=ACoAAFroY70Bsc4WEY_PzNwsOjcoGkIDPhjNaCY)

> *(Click the link above to see the app in action — includes UI, login, and Task Management Features!)*

---

## 🧪 Getting Started

### Prerequisites

- Flutter SDK (3.x or above)
- Dart SDK
- IDE (Android Studio, VS Code, etc.)

### Run Locally

```bash
git clone https://github.com/your-username/taskmaster.git
cd taskmaster
flutter pub get
flutter run
