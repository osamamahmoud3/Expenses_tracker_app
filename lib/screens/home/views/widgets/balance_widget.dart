import 'dart:math';

import 'package:expenses_tracker_app/screens/add_expenses/view/widgets/add_expenses_button.dart';
import 'package:expenses_tracker_app/screens/add_expenses/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cubit/flose_cubit.dart';
import 'total_balance_and_income_and_expenses.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  late TextEditingController balanceController;
  @override
  void initState() {
    balanceController = context.read<FolseCubit>().balanceController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.21,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Theme.of(context).colorScheme.onSurface,
                  offset: const Offset(5, 5))
            ],
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).primaryColor,
            ], transform: const GradientRotation(pi / 4)),
          ),
          child: const TotalBalanceAndIncomeAndExpenses()),
      Positioned(
          top: -15,
          left: -15,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (cnx) => BlocProvider.value(
                        value: context.read<FolseCubit>(),
                        child: AlertDialog(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          title: Text('Add Balance',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                  controller: balanceController,
                                  keyboardType: TextInputType.number,
                                  hintText: 'Amount',
                                  icon: const Icon(Icons.money_outlined)),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: CustomButton(
                                  onPressed: () {
                                    context.read<FolseCubit>().addBalance();

                                    Navigator.pop(context);
                                  },
                                  text: 'Add',
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
            },
            child: const CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 25,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          )),
    ]);
  }
}
