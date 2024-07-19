import 'package:bloc/bloc.dart';
import 'package:expenses_repository/expenses_repository.dart';
import 'package:flutter/material.dart';

part 'add_expenes_state.dart';

class AddExpenesCubit extends Cubit<AddExpenesState> {
  final ExpensesRepo expensesRepo;
  AddExpenesCubit(this.expensesRepo) : super(AddExpenesInitial());
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  String color = '#FF0000';
  String icon = 'burger';

  TextEditingController dateController =
      TextEditingController(text: DateTime.now().toString().substring(0, 10));

  Future<void> createCategory() async {
    emit(AddExpenesLoading());
    try {
      await expensesRepo.createCategory(
          date: dateController.text,
          name: categoryNameController.text,
          icon: icon,
          color: color,
          totalAmount: -1 * int.parse(amountController.text));
      emit(AddExpenesSuccess());
    } catch (e) {
      emit(AddExpenesError(e.toString()));
    }
  }
}
