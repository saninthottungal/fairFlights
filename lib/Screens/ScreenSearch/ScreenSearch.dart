import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //from searchfield

            CupertinoSearchTextField(
              placeholder: 'Origin',
              padding: const EdgeInsets.all(12),
              controller: fromController,
            ),
            const SizedBox(height: 10),

            //to searchfield
            CupertinoSearchTextField(
              placeholder: 'Destination',
              padding: const EdgeInsets.all(12),
              controller: toController,
            ),
            const SizedBox(height: 10),
            const Divider(height: 25),

            //listview separated
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "DEL",
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                    title: Text("data"),
                    subtitle: Text("data"),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
