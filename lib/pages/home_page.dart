// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'package:coffeappui/util/coffee_tile.dart';
import 'package:coffeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelected ]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ]
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      //this for make everything false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.menu, color: Colors.orange),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            )
          ],
        ),
        body: Column(
          children: [
            // Find the best coffee for you
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "FIND THE BEST COFFEE FOR YOU",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // horizontal listview of coffee types
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                },
              ),
            ),

            // horizontal listview of coffee titles

            Expanded(
                child: ListView(scrollDirection: Axis.horizontal, children: [
              CoffeeTile(
                coffeeImagePath:
                    'lib/images/bence-boros-TMkrYpWW7kc-unsplash.jpeg',
                coffeeName: 'Cappucino',
                coffeePrice: '4.20',
              ),
              CoffeeTile(
                coffeeImagePath:
                    'lib/images/nathan-dumlao-cEJwMalRit8-unsplash.jpeg',
                coffeeName: 'Latte',
                coffeePrice: '4.10',
              ),
              CoffeeTile(
                coffeeImagePath:
                    'lib/images/ceyda-ciftci-nNjxgeGuzAs-unsplash.jpeg',
                coffeeName: 'Black',
                coffeePrice: '4.00',
              )
            ]))
          ],
        ));
  }
}
