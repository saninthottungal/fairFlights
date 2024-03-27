import 'package:flight_booking/Screens/ScreenFlights/Widgets/AppBar.dart';
import 'package:flutter/material.dart';

class ScreenFlights extends StatelessWidget {
  const ScreenFlights({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return SizedBox(
                    height: height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Sort"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Cheapest First"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Trip Duration"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rating"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Departure Time"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Arrival Time"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          "MAR",
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 20, indent: 10),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 5, right: 5, bottom: 5),
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
                                        color: index == 1
                                            ? Colors.lightBlue
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Flexible(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Air India, United Airlines",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(),
                                Column(
                                  children: [
                                    Text(
                                      "07:15",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text("DEL"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("24h 50m"),
                                    Divider(),
                                    Text("1 stop"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "07:15",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text("DEL"),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "\$82705",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 10,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
