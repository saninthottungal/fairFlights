import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Screens/ScreenHotel/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScreenHotel extends StatelessWidget {
  const ScreenHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 350,
          child: Image.asset(
            'assets/hotel.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(20, 61, 187, 0.9),
                ),
                child: Center(
                  child: Card(
                    elevation: 5,
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search place",
                        contentPadding: EdgeInsets.all(17.0),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CheckInCheckOutDate(
                      title: "CHECK-IN",
                      month: "Mar",
                      day: "Tuesday",
                    ),
                    Center(
                      child: Container(
                        color: Colors.grey[400],
                        width: 1,
                        height: 70,
                      ),
                    ),
                    const CheckInCheckOutDate(
                      title: "CHECK-OUT",
                      month: "Mar",
                      day: "Tuesday",
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 218, 218, 218),
                    ),
                    top: BorderSide(
                      color: Color.fromARGB(255, 218, 218, 218),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      child: Text(
                        "ROOMS",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: DropdownButton(
                        hint: const Text(
                          "1 Room, 2 Adults",
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 15, 15),
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem<String>(
                            value: "value",
                            child: Text("value"),
                          ),
                          DropdownMenuItem<String>(
                            value: "value",
                            child: Text(
                              "value",
                            ),
                          ),
                        ],
                        // icon: const Icon(
                        //   Icons.keyboard_arrow_down_rounded,
                        // ),
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 60),
                child: Container(
                  width: double.infinity,
                  height: 53,
                  decoration: BoxDecoration(
                    color: AppColor.customBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "SEARCH HOTELS",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
