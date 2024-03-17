import 'package:flutter/material.dart';

class PassportInputItem extends StatelessWidget {
  final String label;
  final String hint;
  const PassportInputItem({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 260,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
