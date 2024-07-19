import 'package:flutter/material.dart';

class MainScreenAppBar extends StatelessWidget {
  const MainScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.yellow[700]),
          child: Icon(Icons.person, color: Colors.yellow[900]),
        ),
        const SizedBox(width: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'welcome',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          Text(
            'osama mahmoud',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ]),
        const Spacer(),
        Icon(Icons.settings_outlined,
            color: Theme.of(context).colorScheme.outline),
      ],
    );
  }
}
