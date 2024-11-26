# **Flutter Project Setup Guide**

Welcome to the Flutter project! This README provides step-by-step instructions to set up and run the project on your local machine. Follow these steps to ensure everything is configured correctly.

---

## **Prerequisites**
Make sure you have the following installed:
- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio or Xcode (for device emulators and debugging)
- Git (for cloning the repository)

---

## **Setup Steps**

### 1. **Clone the Repository**
```bash
git clone [<repository_url>](https://github.com/durgesh-k/meal_report_app)
cd [<project_directory>](https://github.com/durgesh-k/meal_report_app)
```

### 2. **Install Dependencies**
Run the following command to install all required dependencies:
```bash
flutter pub get
```

### 3. **Generate Files**
If the project uses code generation (e.g., for JSON serialization or dependency injection), run:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. **Configure Splash Screen**
To set up the native splash screen, execute:
```bash
dart run flutter_native_splash:create
```

### 5. **Run the Project**
Run the application on your connected device or emulator:
```bash
flutter run
```

---

## **Additional Commands**

### Clean the Project
To remove build artifacts:
```bash
flutter clean
```

### Analyze the Code
To analyze the code for errors and warnings:
```bash
flutter analyze
```

### Run Tests
To execute the test suite:
```bash
flutter test
```

---

## **Notes**
- Ensure your **emulator or device** is running before executing `flutter run`.  
- If you encounter issues with build files, run:
  ```bash
  flutter clean
  flutter pub get
  ```
- For custom splash screen configurations, modify the `flutter_native_splash.yaml` file.

---

## **Support**
If you face any issues, feel free to raise an issue in the repository or contact the maintainer.

Happy coding! 🚀
