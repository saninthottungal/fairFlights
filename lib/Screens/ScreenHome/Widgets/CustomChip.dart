import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function(bool?) onSelected;
  final Color color;
  const CustomChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
    required this.color,
  });

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
          selected: isSelected,
          showCheckmark: false,
          labelPadding: const EdgeInsets.all(0),
          // selectedColor: Colors.lightBlue,
          // backgroundColor: AppColor.customBlue.withOpacity(0.85),
          shadowColor: Colors.transparent,
          color: MaterialStatePropertyAll(color),
        ));
  }
}
