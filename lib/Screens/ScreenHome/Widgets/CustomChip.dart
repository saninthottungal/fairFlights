import 'package:flutter/material.dart';

class CustomChip<T extends Enum> extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.title,
    required this.onSelected,
    required this.value,
    required this.groupValue,
    required this.selectedColor,
    required this.disabledColor,
  });
  final String title;
  final T value;
  final T groupValue;
  final void Function(bool?) onSelected;
  final Color selectedColor;
  final Color disabledColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ChoiceChip(
          onSelected: onSelected,
          label: Text(title),
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.9),
          ),
          selected: value == groupValue,
          showCheckmark: false,
          labelPadding: const EdgeInsets.all(0),
          // selectedColor: Colors.lightBlue,
          // backgroundColor: AppColor.customBlue.withOpacity(0.85),
          shadowColor: Colors.transparent,
          color: value == groupValue
              ? MaterialStatePropertyAll(selectedColor)
              : MaterialStatePropertyAll(disabledColor),
        ));
  }
}
