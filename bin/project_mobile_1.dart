import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
/// Main Menu Loop

  while (true) {
    print("======== Expense Tracking App =========");
    print("Welcome ");
    print("1. All expenses");
    print("2. Today's expense");
    print("3. Search expense");
    print("4. Add new expense");
    print("5. Delete an expense");
    print("6. Exit");
    stdout.write("Choose (1-6): ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case "1":

        break;
      case "2":

        break;
      case "3":

        break;
      case "4":

        break;
      case "5":
        
        break;
      case "6":
        print("---- 👋 Bye  -------");
        return; 
      default:
        print("⚠️ Invalid choice\n");
    }
  }
}

