import 'dart:io';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) {
      print("⚠️ You cannot divide by zero!");
      return double.nan;
    }
    return a / b;
  }

  double _readNumber(String message) {
    while (true) {
      stdout.write(message);
      try {
        final input = stdin.readLineSync();
        if (input == null || input.trim().isEmpty) {
          throw FormatException("Empty input");
        }
        return double.parse(input);
      } catch (e) {
        print("❌ Invalid input. Please enter a valid number.\n");
      }
    }
  }

  void run() {
    bool running = true;
    print("📘 Welcome to the Simple Calculator!");
    print("----------------------------------------");

    while (running) {
      final a = _readNumber("👉 Enter the first number: ");
      final b = _readNumber("👉 Enter the second number: ");

      print("\nChoose an operation:");
      print("1️⃣ - Add");
      print("2️⃣ - Subtract");
      print("3️⃣ - Multiply");
      print("4️⃣ - Divide");
      print("5️⃣ - Quit");

      stdout.write("Your choice: ");
      final choice = stdin.readLineSync();

      switch (choice) {
        case "1":
          print("✅ Result: ${add(a, b)}\n");
          break;
        case "2":
          print("✅ Result: ${subtract(a, b)}\n");
          break;
        case "3":
          print("✅ Result: ${multiply(a, b)}\n");
          break;
        case "4":
          print("✅ Result: ${divide(a, b)}\n");
          break;
        case "5":
          print("👋 Exiting calculator. Goodbye!");
          running = false;
          break;
        default:
          print("❌ Invalid choice. Please select a number between 1 and 5.\n");
      }
    }
  }
}
