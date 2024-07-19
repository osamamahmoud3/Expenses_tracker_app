import 'package:expenses_tracker_app/core/helper/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/cubit/add_expenes_cubit.dart';
import 'add_expenses_button.dart';
import 'custom_text_field.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int selectedIconIndex = 0;
  List<String> colors = [
    "#32012F",
    "#F97300",
    "#00FF00",
    "#00215E",
    "#B5C18E",
    "#41B06E",
  ];
  late TextEditingController categoryNameController;
  List<String> categoryIcons = [
    "burger",
    "plane",
    "mugHot",
    "heartPulse",
    "home",
    "bagShopping",
    "dumbbell"
  ];
  int selectedColorIndex = 0;
  @override
  void initState() {
    categoryNameController =
        context.read<AddExpenesCubit>().categoryNameController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: IntrinsicHeight(
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                      controller: categoryNameController,
                      hintText: 'Category Name',
                      icon: const Icon(FontAwesomeIcons.dollarSign)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: colors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorIndex = index;
                              });
                              context.read<AddExpenesCubit>().color =
                                  colors[index];
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: selectedColorIndex == index
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Color(int.parse(
                                          colors[index]
                                              .replaceAll("#", "0xFF"))),
                                      child: Icon(FontAwesomeIcons.check,
                                          color: Theme.of(context).canvasColor),
                                    )
                                  : CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Color(int.parse(
                                          colors[index]
                                              .replaceAll("#", "0xFF"))),
                                    ),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: categoryIcons.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIconIndex = index;
                              });
                              context.read<AddExpenesCubit>().icon =
                                  categoryIcons[index];
                            },
                            child: Icon(categoryIcons[index].toIconData(),
                                color: selectedIconIndex == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.outline,
                                size: 50),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: "Add",
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}
