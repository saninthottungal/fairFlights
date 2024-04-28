import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCountrySearch extends StatelessWidget {
  ScreenCountrySearch({super.key});

  final cityController = TextEditingController();

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
              controller: cityController,
              onChanged: (value) {
                context.read<FirestoreProvider>().searchCountry(value);
              },
              onSuffixTap: () {
                context.read<FirestoreProvider>().setSearchCountries();
                cityController.clear();
              },
              prefixIcon: const Icon(Icons.search),
              padding: const EdgeInsets.all(12),
              placeholder: 'search country',
            ),
            Expanded(
              child:
                  Consumer<FirestoreProvider>(builder: (context, provider, _) {
                return provider.searchCountries.isEmpty
                    ? const Center(
                        child: Text("No cities Found"),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              provider.setCountry = provider
                                  .searchCountries[index].entries.first.value;
                              Future.delayed(const Duration(milliseconds: 200),
                                  () {
                                Navigator.pop(context);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 10),
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
                                    provider.searchCountries[index].entries
                                        .first.value,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: provider.searchCountries.length,
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
