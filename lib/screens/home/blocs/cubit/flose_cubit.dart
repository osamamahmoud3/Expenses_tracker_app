import 'package:bloc/bloc.dart';
import 'package:expenses_repository/expenses_repository.dart';
import 'package:flutter/material.dart';

part 'flose_state.dart';

class FolseCubit extends Cubit<FloseState> {
  final ExpensesRepo expensesRepo;
  FolseCubit(this.expensesRepo) : super(GetExpensesInitial());
  TextEditingController balanceController = TextEditingController();

  Future<void> getExpenses() async {
    emit(GetExpensesLoading());
    try {
      final list = await expensesRepo.getCategories();
      emit(GetExpensesSuccess(list));
    } catch (e) {
      emit(GetExpensesError(e.toString()));
    }
  }

  Future<void> addBalance() async {
    emit(AddBalanceLoading());
    try {
      await expensesRepo.addBalance(
          totalAmount: int.parse(balanceController.text));
      print("balance added");
      await getBalance();
      emit(AddBalanceSuccess());
    } catch (e) {
      emit(AddBalanceError(e.toString()));
    }
  }

  Future<void> getBalance() async {
    try {
      final balanceModel = await expensesRepo.getBalance();
      emit(getBalanceSuccess(balanceModel));
    } catch (e) {
      emit(getBalanceError(e.toString()));
    }
  }
}
