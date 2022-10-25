import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(19.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Image.asset("assets/day.png")),
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.0),
            child: Text(
              "Peter Mach",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.0),
            child: Text(
              "Mind Deep Relax",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.",
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 19.0),
            padding: EdgeInsets.symmetric(vertical: 11.0),
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(90))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Text(
                  'Play Next Session',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                padding: EdgeInsets.all(11),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SweetMemories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Text(
                    "December 29 Pre-Launch",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Icon(
                Icons.more_horiz_sharp,
                color: Colors.grey,
                size: 39,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  padding: EdgeInsets.all(11),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A Day Dream",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      "December 29 Pre-Launch",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.more_horiz_sharp,
                  color: Colors.grey,
                  size: 39,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  padding: EdgeInsets.all(11),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mind Explore",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      "December 29 Pre-Launch",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.more_horiz_sharp,
                  color: Colors.grey,
                  size: 39,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ]),
      ),
    );
  }
}
