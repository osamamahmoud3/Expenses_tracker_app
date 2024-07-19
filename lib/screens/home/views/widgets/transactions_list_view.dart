import 'package:expenses_tracker_app/core/helper/extension.dart';
import 'package:expenses_tracker_app/screens/home/blocs/cubit/flose_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactions_list_view_item.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FolseCubit, FloseState>(
        buildWhen: (previous, current) =>
            current is GetExpensesSuccess ||
            current is GetExpensesError ||
            current is GetExpensesLoading,
        builder: (context, state) {
          if (state is GetExpensesSuccess) {
            state.list.sort((a, b) =>
                DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));

            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: TransactionsListViewItem(
                    color: Color(int.parse(
                        state.list[index].color.replaceAll("#", "0xFF"))),
                    icon: Icon(state.list[index].icon.toIconData()),
                    title: state.list[index].name,
                    totalAmount: state.list[index].totalAmount.toString(),
                    date: state.list[index].date.toString(),
                  ),
                );
              },
            );
          } else if (state is GetExpensesError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
