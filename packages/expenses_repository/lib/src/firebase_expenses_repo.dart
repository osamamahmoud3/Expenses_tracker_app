import 'package:cloud_firestore/cloud_firestore.dart';

import '../expenses_repository.dart';

class FirebaseExpensesRepo implements ExpensesRepo {
  final categoryCollection =
      FirebaseFirestore.instance.collection('categories');
  final totalAmountCollection =
      FirebaseFirestore.instance.collection('totalAmount');

  @override
  Future<void> createCategory({
    required String name,
    required String icon,
    required String date,
    required String color,
    required int totalAmount,
  }) async {
    try {
      // Step 1: Add the new category
      await categoryCollection.doc().set({
        "name": name,
        "icon": icon,
        "color": color,
        "date": date,
        "totalAmount": totalAmount,
      });

      // Step 2: Deduct the totalAmount from the current balance
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ExpensesModel>> getCategories() async {
    try {
      List<ExpensesModel> list = [];
      await categoryCollection.get().then((value) {
        for (var element in value.docs) {
          list.add(ExpensesModel(
            name: element['name'],
            icon: element['icon'],
            color: element['color'],
            date: element['date'],
            totalAmount: element['totalAmount'],
            id: element.id,
          ));
        }
      });
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addBalance({
    required int totalAmount,
  }) async {
    try {
      await categoryCollection.doc().set({
        "name": "income",
        "icon": 'arrow_downward_outlined',
        "color": '#00FF00',
        "date": DateTime.now().toString().substring(0, 10),
        "totalAmount": totalAmount,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BalanceModel> getBalance() async {
    try {
      int totalIncome = 0;
      int totalExpenses = 0;

      final categoriesSnapshot = await categoryCollection.get();
      for (var doc in categoriesSnapshot.docs) {
        int amount = doc['totalAmount'];
        if (amount > 0) {
          totalIncome += amount;
        } else {
          totalExpenses -= amount; // Convert negative to positive
        }
      }
      // @override
      // Future<void> deleteCategory(String categoryId) async {
      //   try {
      //     // Step 1: Delete the category document
      //     await categoryCollection.doc(categoryId).delete();

      //     // Step 2: Optionally update totalAmount after deletion
      //     // In this case, let's assume you want to adjust totalAmount after deleting a category.
      //     // You might want to implement this according to your specific requirements.

      //     // Example: Deducting from totalAmount after deletion
      //     // Get the totalAmount for the deleted category
      //     final categoryDoc = await categoryCollection.doc(categoryId).get();
      //     if (categoryDoc.exists) {
      //       int totalAmount = categoryDoc['totalAmount'];
      //       await _deductFromBalance(totalAmount);
      //     }
      //   } catch (e) {
      //     rethrow;
      //   }
      // }

      return BalanceModel(
        totalIncome: totalIncome,
        totalExpenses: totalExpenses,
        id: 'currentTotal',
        totalAmount: totalIncome - totalExpenses,
      );
    } catch (e) {
      rethrow;
    }
  }
}
