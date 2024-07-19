import 'package:expenses_tracker_app/screens/add_expenses/blocs/cubit/add_expenes_cubit.dart';
import 'package:expenses_tracker_app/screens/add_expenses/view/widgets/add_expenses_bloc_listiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/add_expenses_button.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_text_field.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({super.key});

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  DateTime selectedDate = DateTime.now();
  late TextEditingController amountController;
  late TextEditingController dateController;

  @override
  void initState() {
    amountController = context.read<AddExpenesCubit>().amountController;
    dateController = context.read<AddExpenesCubit>().dateController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text('Add Expenses',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary)),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      hintText: "amount",
                      icon: Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Theme.of(context).colorScheme.outline,
                      )),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Category",
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (cnx2) {
                              return BlocProvider.value(
                                value: context.read<AddExpenesCubit>(),
                                child: const CustomBottomSheet(),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.list,
                      color: Theme.of(context).colorScheme.outline,
                    )),
                const SizedBox(height: 16),
                CustomTextField(
                    controller: dateController,
                    onTap: () async {
                      DateTime? newData = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.dark(
                                  onSurface:
                                      Theme.of(context).colorScheme.outline,
                                  onSecondary:
                                      Theme.of(context).colorScheme.outline,
                                  primary:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              child: child!,
                            );
                          },
                          barrierColor: Colors.transparent,
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)));

                      if (newData != null) {
                        dateController.text =
                            newData.toString().substring(0, 10);
                        selectedDate = newData;
                      }
                    },
                    readOnly: true,
                    hintText: "Date",
                    icon: Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.outline,
                    )),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomButton(
                    onPressed: () {
                      context.read<AddExpenesCubit>().createCategory();
                    },
                    text: "Add Expense",
                  ),
                ),
                const SizedBox(height: 16),
                const AddExpensesBlocListiner(),
              ],
            ),
          )),
    );
  }
}
