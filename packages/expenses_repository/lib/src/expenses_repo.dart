import '../expenses_repository.dart';

abstract class ExpensesRepo {
  Future<void> createCategory(
      {required String name,
      required String icon,
      required String color,
      required String date,
      required int totalAmount});
  Future<List<ExpensesModel>> getCategories();
  Future<void> addBalance({required int totalAmount});
  Future<BalanceModel> getBalance();
}
