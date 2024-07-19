import 'package:expenses_tracker_app/screens/home/blocs/cubit/flose_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BalancePewcentIndicator extends StatelessWidget {
  const BalancePewcentIndicator({
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                arcType: ArcType.FULL,
                backgroundColor: Colors.transparent,
                radius: 50.0,
                lineWidth: 10.0,
                footer: Text('Total',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                percent: 1,
                center: Text(
                  "100%",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                progressColor: Colors.green,
              ),
              CircularPercentIndicator(
                arcType: ArcType.FULL,
                backgroundColor: Colors.transparent,
                radius: 50.0,
                lineWidth: 10.0,
                footer: Text('Income',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                percent: state.balanceModel.totalAmount /
                    state.balanceModel.totalIncome,
                center: Text(
                  "${((state.balanceModel.totalAmount / state.balanceModel.totalIncome) * 100).toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                progressColor: Colors.yellow,
              ),
              CircularPercentIndicator(
                arcType: ArcType.FULL,
                backgroundColor: Colors.transparent,
                radius: 50.0,
                lineWidth: 10.0,
                footer: Text('Expenses',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                percent: state.balanceModel.totalAmount /
                    state.balanceModel.totalIncome,
                center: Text(
                  "${((state.balanceModel.totalExpenses / state.balanceModel.totalAmount) * 100).toStringAsFixed(2)}%",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                progressColor: Colors.blue,
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
