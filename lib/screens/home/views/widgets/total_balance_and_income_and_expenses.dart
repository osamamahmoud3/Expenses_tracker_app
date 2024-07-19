import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cubit/flose_cubit.dart';

class TotalBalanceAndIncomeAndExpenses extends StatelessWidget {
  const TotalBalanceAndIncomeAndExpenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FolseCubit, FloseState>(
      buildWhen: (previous, current) =>
          current is getBalanceSuccess ||
          current is getBalanceError ||
          current is getBalanceLoading,
      builder: (context, state) {
        if (state is getBalanceSuccess) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Total Balance',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(
              'EG ${state.balanceModel.totalAmount}.00',
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 18,
                    child: Icon(
                      Icons.arrow_downward_outlined,
                      color: Color.fromARGB(255, 135, 240, 139),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Income',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        state.balanceModel.totalIncome.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundColor: Colors.white30,
                    radius: 18,
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expenses',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        state.balanceModel.totalExpenses.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]);
        } else if (state is getBalanceError) {
          return const Text('Error');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
