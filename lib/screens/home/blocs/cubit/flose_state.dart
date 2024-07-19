part of 'flose_cubit.dart';

@immutable
sealed class FloseState {}

final class GetExpensesInitial extends FloseState {}

final class GetExpensesLoading extends FloseState {}

final class GetExpensesSuccess extends FloseState {
  final List<ExpensesModel> list;
  GetExpensesSuccess(this.list);
}

final class GetExpensesError extends FloseState {
  final String message;
  GetExpensesError(this.message);
}

final class AddBalanceSuccess extends FloseState {}

final class AddBalanceError extends FloseState {
  final String message;
  AddBalanceError(this.message);
}

final class AddBalanceLoading extends FloseState {}

final class getBalanceSuccess extends FloseState {
  final BalanceModel balanceModel;
  getBalanceSuccess(this.balanceModel);
}

final class getBalanceError extends FloseState {
  final String message;
  getBalanceError(this.message);
}

final class getBalanceLoading extends FloseState {}
