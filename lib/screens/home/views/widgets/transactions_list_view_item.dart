import 'package:flutter/material.dart';

class TransactionsListViewItem extends StatelessWidget {
  const TransactionsListViewItem({
    super.key,
    required this.icon,
    required this.title,
    required this.totalAmount,
    required this.date,
    required this.color,
  });
  final Widget icon;
  final String title;
  final String totalAmount;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.onPrimary),
        child: Row(children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 25,
            child: icon,
          ),
          const SizedBox(width: 20),
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary)),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(totalAmount.contains('-') ? totalAmount : totalAmount,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: totalAmount.contains('-')
                          ? Colors.red
                          : Colors.green)),
              Text(date,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline)),
            ],
          )
        ]));
  }
}
