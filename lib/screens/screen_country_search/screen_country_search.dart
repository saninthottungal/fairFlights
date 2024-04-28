import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              child:
                  Consumer<FirestoreProvider>(builder: (context, provider, _) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                Icons.location_city,
                                color: Colors.black38,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Text(
                              provider.countries[index].entries.first.value,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: provider.countries.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
