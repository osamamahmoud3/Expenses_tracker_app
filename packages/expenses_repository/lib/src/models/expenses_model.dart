class ExpensesModel {
  final String name;
  final String icon;
  final String color;
  final String date;
  final int totalAmount;
  final String id;

  ExpensesModel(
      {required this.name,
      required this.icon,
      required this.color,
      required this.date,
      required this.totalAmount,
      required this.id});
}

class BalanceModel {
  final String id;
  final int totalIncome;
  final int totalExpenses;
  final int totalAmount;

  BalanceModel({
    required this.totalIncome,
    required this.totalExpenses,
    required this.id,
    required this.totalAmount,
  });
}
