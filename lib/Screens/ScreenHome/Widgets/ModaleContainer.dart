import 'package:flight_booking/Screens/ScreenHome/Widgets/Counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModaleContainer extends StatelessWidget {
  const ModaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {},
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 27,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {},
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )),
          const Divider(height: 0),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Travellers",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Counter(title: 'Adults', subtitle: 'Over 15'),
                const SizedBox(height: 8),
                const Counter(title: 'Children', subtitle: '2 - 15'),
                const SizedBox(height: 8),
                const Counter(title: 'Infants', subtitle: 'Under 2'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
