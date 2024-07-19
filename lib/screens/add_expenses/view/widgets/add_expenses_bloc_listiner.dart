import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cubit/add_expenes_cubit.dart';

class AddExpensesBlocListiner extends StatelessWidget {
  const AddExpensesBlocListiner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddExpenesCubit, AddExpenesState>(
      listenWhen: (previous, current) =>
          current is AddExpenesSuccess ||
          current is AddExpenesError ||
          current is AddExpenesLoading,
      listener: (context, state) {
        if (state is AddExpenesSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Expense added successfully'),
            ),
          );
        } else if (state is AddExpenesError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else {
          showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()));
        }
      },
      child: Container(),
    );
  }
}
