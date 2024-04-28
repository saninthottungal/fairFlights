import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCountrySearch extends StatelessWidget {
  ScreenCountrySearch({super.key});

  final cityControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose a country",
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: cityControlller,
              prefixIcon: const Icon(Icons.search),
              padding: const EdgeInsets.all(12),
              placeholder: 'search country',
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Icon(
                              Icons.location_city,
                              color: Colors.black38,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 25),
                          Text(
                            "India",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
