import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/home_providers/counter_provider.dart';
import 'package:flight_booking/providers/home_providers/class_chip_provider.dart';
import 'package:flight_booking/providers/home_providers/traveller_class_provider.dart';
import 'package:flight_booking/screens/screen_home/Widgets/counter.dart';
import 'package:flight_booking/screens/screen_home/Widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModaleContainer extends StatelessWidget {
  const ModaleContainer({super.key, required this.ctx});
  final BuildContext ctx;

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
                    final counterProvider =
                        Provider.of<CounterProvider>(context, listen: false);
                    final classProvider =
                        Provider.of<ClassChipProvider>(context, listen: false);
                    final travellerClassProvider =
                        Provider.of<TravellerClassProvider>(context,
                            listen: false);

                    travellerClassProvider.setTravellersCount =
                        counterProvider.travellersCount;
                    travellerClassProvider.setClassType =
                        classProvider.selectedType;
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
                      int value = counter.adult + 1;
                      // /print(value);

                      counter.setAdultCount(value);
                    },
                    onPressedOnRemove: () {
                      int value = counter.adult - 1;
                      counter.setAdultCount(value);
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
                      int value = counter.children + 1;
                      counter.setChildrenCount(value);
                    },
                    onPressedOnRemove: () {
                      int value = counter.children - 1;
                      counter.setChildrenCount(value);
                    },
                  );
                }),
                const SizedBox(height: 8),
                Consumer<CounterProvider>(builder: (ctx, counter, _) {
                  return Counter(
                    title: 'Infants',
                    subtitle: 'Under 2',
                    count: counter.infant,
                    onPressedOnAdd: () {
                      int value = counter.infant + 1;
                      counter.setInfantCount(value);
                    },
                    onPressedOnRemove: () {
                      int value = counter.infant - 1;
                      counter.setInfantCount(value);
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
                Consumer<ClassChipProvider>(builder: (context, chip, _) {
                  return Row(
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
                      // CustomChip(
                      //   title: "Premium Economy",
                      //   value: ClassType.premiumEconomy,
                      //   groupValue: chip.selectedType,
                      //   onSelected: (value) {
                      //     chip.onChanged(ClassType.premiumEconomy);
                      //   },
                      //   selectedColor: AppColor.customBlue,
                      //   disabledColor: AppColor.customBlue.withOpacity(0.5),
                      // ),
                      CustomChip(
                        title: "Business",
                        value: ClassType.buissness,
                        groupValue: chip.selectedType,
                        onSelected: (value) {
                          chip.onChanged(ClassType.buissness);
                        },
                        selectedColor: AppColor.customBlue,
                        disabledColor: AppColor.customBlue.withOpacity(0.5),
                      ),
                      // CustomChip(
                      //   title: "First Class",
                      //   value: ClassType.firstClass,
                      //   groupValue: chip.selectedType,
                      //   onSelected: (value) {
                      //     chip.onChanged(ClassType.firstClass);
                      //   },
                      //   selectedColor: AppColor.customBlue,
                      //   disabledColor: AppColor.customBlue.withOpacity(0.5),
                      // ),
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
