import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenFlight extends StatelessWidget {
  const ScreenFlight({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "5000",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const ListTile(
                title: Row(
                  children: [
                    Text(
                      "Las Vegas",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " - ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kochi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Travel time : 31h 31m",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const Card(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.face),
                      ),
                      title: Text(
                        "Frontier Airlines",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        "02h 46m",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.face)),
                      title: Row(
                        children: [
                          Text(
                            "11:59 pm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Las Vegas",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("30 Apr, Tue"),
                          SizedBox(width: 21),
                          Text("McCarran airport,DFW")
                        ],
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.face)),
                      title: Row(
                        children: [
                          Text(
                            "11:59 pm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Las Vegas",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("30 Apr, Tue"),
                          SizedBox(width: 21),
                          Text("McCarran airport,DFW")
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      color: Colors.black12,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.assist_walker),
                        ),
                        title: Text(
                          "Layover in Dallas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "02h 15m",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.face),
                      ),
                      title: Text(
                        "Frontier Airlines",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        "02h 46m",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.face)),
                      title: Row(
                        children: [
                          Text(
                            "11:59 pm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Las Vegas",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("30 Apr, Tue"),
                          SizedBox(width: 21),
                          Text("McCarran airport,DFW")
                        ],
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.face)),
                      title: Row(
                        children: [
                          Text(
                            "11:59 pm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Las Vegas",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("30 Apr, Tue"),
                          SizedBox(width: 21),
                          Text("McCarran airport,DFW")
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      color: Colors.black12,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.assist_walker),
                        ),
                        title: Text(
                          "Layover in Dallas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "02h 15m",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.95,
                child: CupertinoButton(
                    color: Colors.green,
                    child: const Text("Buy for 520"),
                    onPressed: () {}),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
