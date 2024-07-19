import 'package:flutter/material.dart';

class TransactionsAndSeeAllText extends StatelessWidget {
  const TransactionsAndSeeAllText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Transactions',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary)),
        const Spacer(),
        Text('See all',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.outline)),
      ],
    );
  }
}
