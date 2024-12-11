# Budget Tracker App 💸📊

A powerful and easy-to-use **Budget Tracker App** developed using the **Flutter framework**, **SQLite**, **GetX**, and the **path** package. This app allows you to efficiently manage your finances by providing features to **insert**, **delete**, **update**, **create records**, and **track dates** in the database.

---

## 🎨 Features

1. **Add Records** ➕: Easily insert financial records into the app's database.
2. **Update Records** ✏️: Modify existing records seamlessly.
3. **Delete Records** ❌: Remove unwanted records in just a tap.
4. **Date Tracking** 🔇: Organize records by specific dates for better tracking.
5. **Create Database** 📝: Auto-generate the SQLite database to store your financial data securely.
6. **State Management** 🤝: Implemented with **GetX** for reactive and efficient state handling.

---

## 🔧 Tech Stack

- **Flutter**: Cross-platform development framework.
- **SQLite**: Lightweight database for local storage.
- **GetX**: State management and dependency injection.
- **Path**: For database path handling.

---

## 🔗 Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/budget-tracker.git
   ```

2. **Navigate to the Project Directory:**
   ```bash
   cd budget-tracker
   ```

3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the App:**
   ```bash
   flutter run
   ```

---

## 🔎 Code References

### 1. Database Initialization
```dart
final databasePath = await getDatabasesPath();
final path = join(databasePath, 'budget_tracker.db');
final database = await openDatabase(
  path,
  version: 1,
  onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE transactions(id INTEGER PRIMARY KEY, name TEXT, amount REAL, date TEXT)'
    );
  },
);
```

### 2. Insert Record
```dart
Future<void> insertTransaction(Map<String, dynamic> transaction) async {
  await database.insert(
    'transactions',
    transaction,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
```

### 3. Update Record
```dart
Future<void> updateTransaction(int id, Map<String, dynamic> transaction) async {
  await database.update(
    'transactions',
    transaction,
    where: 'id = ?',
    whereArgs: [id],
  );
}
```

### 4. Delete Record
```dart
Future<void> deleteTransaction(int id) async {
  await database.delete(
    'transactions',
    where: 'id = ?',
    whereArgs: [id],
  );
}
```

### 5. Fetch Records by Date
```dart
Future<List<Map<String, dynamic>>> fetchTransactionsByDate(String date) async {
  return await database.query(
    'transactions',
    where: 'date = ?',
    whereArgs: [date],
  );
}
```

---

## 🚀 Demo

Include screenshots or a short video of your app in action here!

---

## 🔧 Improvements
Feel free to suggest features or report issues by opening an [issue](https://github.com/yourusername/budget-tracker/issues) on this repository.

---

## ❤️ Contribute

1. Fork the repository.
2. Create a new branch for your feature: `git checkout -b feature-name`
3. Commit your changes: `git commit -m 'Add feature-name'`
4. Push to the branch: `git push origin feature-name`
5. Create a pull request.

---

## 📚 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


<p>
  <img src="https://github.com/user-attachments/assets/4df7baa2-e7f2-48f2-bf6d-bcae346fed0f" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/7a138b3b-667e-44e4-b773-251d80d012d6" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/c667bea6-4491-48e8-8456-ef2023dd23c3" width="22%" Height="35%">
</p>
