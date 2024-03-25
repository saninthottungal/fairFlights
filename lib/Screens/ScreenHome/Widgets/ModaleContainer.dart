import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Providers/HomeProviders/CounterProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/ClassChipProvider.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/Counter.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 27,
                  )),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            height: 0,
            color: Colors.black12,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Travellers",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Consumer<CounterProvider>(builder: (context, counter, _) {
                  return Counter(
                    title: 'Adults',
                    subtitle: 'Over 15',
                    count: counter.adult,
                    onPressedOnAdd: () {
                      if (counter.adult < 9) {
                        counter.adult++;
                      }

                      counter.notify();
                    },
                    onPressedOnRemove: () {
                      if (counter.adult > 1) {
                        counter.adult--;
                      }

                      counter.notify();
                    },
                  );
                }),
                const SizedBox(height: 8),
                Consumer<CounterProvider>(builder: (context, counter, _) {
                  return Counter(
                    title: 'Children',
                    subtitle: '2 - 15',
                    count: counter.children,
                    onPressedOnAdd: () {
                      if (counter.children < 9) {
                        counter.children++;
                      }

                      counter.notify();
                    },
                    onPressedOnRemove: () {
                      if (counter.children > 0) {
                        counter.children--;
                      }

                      counter.notify();
                    },
                  );
                }),
                const SizedBox(height: 8),
                Consumer<CounterProvider>(builder: (context, counter, _) {
                  return Counter(
                    title: 'Infants',
                    subtitle: 'Under 2',
                    count: counter.infant,
                    onPressedOnAdd: () {
                      if (counter.infant < 9) {
                        counter.infant++;
                      }

                      counter.notify();
                    },
                    onPressedOnRemove: () {
                      if (counter.infant > 0) {
                        counter.infant--;
                      }

                      counter.notify();
                    },
                  );
                }),
                const Divider(color: Colors.black12, height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Cabin class",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child:
                      Consumer<ClassChipProvider>(builder: (context, chip, _) {
                    return Wrap(
                      children: [
                        CustomChip(
                          title: "Economy",
                          value: ClassType.economy,
                          groupValue: chip.selectedType,
                          onSelected: (value) {
                            chip.onChanged(ClassType.economy);
                          },
                          selectedColor: AppColor.customBlue,
                          disabledColor: AppColor.customBlue.withOpacity(0.5),
                        ),
                        CustomChip(
                          title: "Premium Economy",
                          value: ClassType.premiumEconomy,
                          groupValue: chip.selectedType,
                          onSelected: (value) {
                            chip.onChanged(ClassType.premiumEconomy);
                          },
                          selectedColor: AppColor.customBlue,
                          disabledColor: AppColor.customBlue.withOpacity(0.5),
                        ),
                        CustomChip(
                          title: "Buissnes",
                          value: ClassType.buissness,
                          groupValue: chip.selectedType,
                          onSelected: (value) {
                            chip.onChanged(ClassType.buissness);
                          },
                          selectedColor: AppColor.customBlue,
                          disabledColor: AppColor.customBlue.withOpacity(0.5),
                        ),
                        CustomChip(
                          title: "First Class",
                          value: ClassType.firstClass,
                          groupValue: chip.selectedType,
                          onSelected: (value) {
                            chip.onChanged(ClassType.firstClass);
                          },
                          selectedColor: AppColor.customBlue,
                          disabledColor: AppColor.customBlue.withOpacity(0.5),
                        ),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
