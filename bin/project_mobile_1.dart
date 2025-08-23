import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  await loginMenu();
}

/// Login Menu
Future<void> loginMenu() async {
  stdout.write("==== Login ====\nUsername: ");
  String username = stdin.readLineSync()!;
  stdout.write("Password: ");
  String password = stdin.readLineSync()!;

  final res = await http.post(
    Uri.parse("http://localhost:3000/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"username": username, "password": password}),
  );

  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    int userId = data['user_id']; // ดึง user_id จาก response
    print("✅ Login success\n");
    await appMenu(userId, username);
  } else {
    print("❌ Login failed : ${res.body}");
  }
  
}
/// Main Menu Loop
Future<void> appMenu(int userId, String username) async {
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

