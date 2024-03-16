import 'package:flight_booking/view/colors.dart';
import 'package:flight_booking/view/home/screens/calendar_screen.dart';
import 'package:flight_booking/view/home/widgets/drop_menu.dart';
import 'package:flutter/material.dart';

class InputsWidget extends StatelessWidget {
  const InputsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: ListView(
        children: [
          Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  if (width >= 411) {
                    return const FromToWidgets(width: 165);
                  }
                  if (width <= 410 && width >= 390) {
                    return const FromToWidgets(width: 155);
                  }
                  if (width <= 390 && width >= 380) {
                    return const FromToWidgets(width: 150);
                  }
                  if (width <= 380 && width >= 370) {
                    return const FromToWidgets(width: 145);
                  }
                  if (width <= 370 && width >= 350) {
                    return const FromToWidgets(width: 135);
                  }
                  if (width <= 350 && width >= 330) {
                    return const FromToWidgets(width: 125);
                  }
                  if (width <= 330 && width >= 311) {
                    return const FromToWidgets(width: 115);
                  } else {
                    return const FromToWidgets(width: 140);
                  }
                },
              ),
              const SizedBox(height: 15),
              const DropMenu2(
                label: "Select Trip*",
                iconData: Icons.expand_more_sharp,
                width: double.infinity,
                items: ["Round Trip", "Single Trip"],
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Card(
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Departure",
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DatePicker(
                          helperText: "03-March-2024 Sunday",
                          label: "Select Trip*",
                          iconData: Icons.calendar_month,
                          width: null,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CalenderScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        const DropMenu3(
                          label: "Select Trip*",
                          iconData: Icons.expand_more_sharp,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Return",
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DatePicker(
                          helperText: "03-March-2024 Sunday",
                          label: "Select Trip*",
                          iconData: Icons.calendar_month,
                          width: null,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CalenderScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        const DropMenu3(
                          label: "Traveller*",
                          iconData: Icons.person,
                          width: null,
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 23),
          Container(
            width: double.infinity,
            height: 53,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Search Flights",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FromToWidgets extends StatelessWidget {
  final double width;
  const FromToWidgets({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DropMenu(
          helperText: "DXB DUBAI",
          label: "From*",
          iconData: Icons.expand_more_sharp,
          // width: double.infinity,
          width: width,
        ),
        const Icon(
          Icons.swap_horiz_outlined,
          color: Colors.white,
          size: 40,
        ),
        DropMenu(
          helperText: "JFK NEW YORK",
          label: "To*",
          iconData: Icons.expand_more_sharp,
          // width: double.infinity,
          width: width,
          //  ,
        ),
      ],
    );
  }
}

class FromToWidgetsColumn extends StatelessWidget {
  final double? width;
  const FromToWidgetsColumn({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropMenu(
          helperText: "DXB DUBAI",
          label: "From*",
          iconData: Icons.expand_more_sharp,
          // width: double.infinity,
          width: width,
        ),
        const Icon(
          Icons.swap_vert,
          color: Colors.white,
          size: 40,
        ),
        DropMenu(
          helperText: "JFK NEW YORK",
          label: "To*",
          iconData: Icons.expand_more_sharp,
          // width: double.infinity,
          width: width,
          //  ,
        ),
      ],
    );
  }
}
