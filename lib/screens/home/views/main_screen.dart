import 'package:expenses_tracker_app/screens/home/views/widgets/transactions_list_view.dart';
import 'package:flutter/material.dart';

import 'widgets/balance_percent_indicator.dart';
import 'widgets/balance_widget.dart';
import 'widgets/main_screen_app_bar.dart';
import 'widgets/transactions_and_see_all_text.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainScreenAppBar(),
            SizedBox(height: 20),
            BalanceWidget(),
            SizedBox(height: 15),
            BalancePewcentIndicator(),
            SizedBox(height: 30),
            TransactionsAndSeeAllText(),
            SizedBox(height: 20),
            TransactionsListView()
          ],
        ),
      ),
    );
  }
}
