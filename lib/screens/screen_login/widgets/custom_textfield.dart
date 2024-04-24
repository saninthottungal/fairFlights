import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.title,
  });

  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(prefixIcon, color: Colors.black38),
                contentPadding: const EdgeInsets.all(15),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                ),
                border: const OutlineInputBorder(),
              )),
        ],
      ),
    );
  }
}
