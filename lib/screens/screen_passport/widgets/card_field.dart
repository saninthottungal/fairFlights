import 'package:flutter/material.dart';

class CardField extends StatelessWidget {
  const CardField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    this.keyboardType,
  });
  final TextEditingController controller;
  final IconData icon;
  final String title;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              )),
          Card(
            child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, color: Colors.black38),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Enter $title",
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }
}
