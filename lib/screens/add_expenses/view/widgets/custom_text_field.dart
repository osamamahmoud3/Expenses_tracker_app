import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      this.keyboardType,
      this.onTap,
      this.readOnly,
      this.controller,
      this.suffixIcon});
  final String hintText;
  final Icon icon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? readOnly;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 20,
      controller: controller,
      style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 16,
          fontWeight: FontWeight.bold),
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType ?? TextInputType.name,
      onTap: onTap ?? () {},
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          prefixIcon: icon,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.onSecondary),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).scaffoldBackgroundColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary))),
    );
  }
}
