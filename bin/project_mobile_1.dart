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
        await showAllExpenses(userId);
        break;
      case "2":
      case "4":
         print("======== Add new item =========");
          stdout.write("Item: ");
          String item = stdin.readLineSync()!;
          stdout.write("Paid: ");
          int paid = int.parse(stdin.readLineSync()!);

          final res = await http.post(
            Uri.parse("http://localhost:3000/expenses"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"user_id": userId, "item": item, "paid": paid}),
          );

          if (res.statusCode == 201) {
            print("Inserted!\n");
          } else {
            print("Error: ${res.body}\n");
          }

        break;

      case "6":
        print("---- 👋 Bye  -------");
        return;
      default:
        print("⚠️ Invalid choice\n");
    }
  }
}

/// freture: Show all expenses
Future<void> showAllExpenses(int userId) async {
  final res = await http.get(
    Uri.parse("http://localhost:3000/expenses?user_id=$userId"),
  );
  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    print("------------ All expenses -----------");
    int total = 0;
    for (int i = 0; i < data.length; i++) {
      var e = data[i];
      print("${i + 1}. ${e['item']} : ${e['paid']}฿ : ${e['date']}");
      total += (e['paid'] ?? 0) as int;
    }
    print("Total expenses = $total ฿\n");
  } else {
    print("⚠️ Error: ${res.body}");
  }
}
