import 'package:expenses_repository/expenses_repository.dart';
import 'package:expenses_tracker_app/screens/add_expenses/blocs/cubit/add_expenes_cubit.dart';
import 'package:expenses_tracker_app/screens/home/blocs/cubit/flose_cubit.dart';
import 'package:expenses_tracker_app/screens/home/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_expenses/view/views/add_expenses_screen.dart';
import '../../statistics/views/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const MainScreen(),
    const StatisticsScreen(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BlocProvider(
              create: (context) => AddExpenesCubit(FirebaseExpensesRepo()),
              child: const AddExpensesScreen(),
            );
          })).then((value) {
            return context.read<FolseCubit>().getExpenses();
          }).then((value) {
            return context.read<FolseCubit>().getBalance();
          });
        },
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary
              ]),
            ),
            child: const Icon(Icons.add)),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            fixedColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            elevation: 3,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq_sharp),
                label: 'Settings',
              ),
            ]),
      ),
      body: screens[currentIndex],
    );
  }
}
