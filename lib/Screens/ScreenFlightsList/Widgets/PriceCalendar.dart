import 'package:flutter/material.dart';

class PriceCalendarWidget extends StatelessWidget {
  const PriceCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                border: index == 1
                    ? const BorderDirectional(
                        bottom: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ))
                    : const Border(),
              ),
              width: 65,
              child: Column(
                children: [
                  Text("Thu, $index"),
                  Text(
                    "\$48569",
                    style: TextStyle(
                        fontSize: 16,
                        color: index == 1 ? Colors.lightBlue : Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
