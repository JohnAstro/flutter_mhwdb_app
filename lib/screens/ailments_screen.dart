import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mhwdb_app/config/globals.dart';
import 'package:flutter_mhwdb_app/utils/mhw_db_api.dart';

class AilmentsScreen extends StatefulWidget {
  const AilmentsScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AilmentsScreen> createState() => _AilmentsScreenState();
}

class _AilmentsScreenState extends State<AilmentsScreen> {
  Future<List<dynamic>> futureAilments = MhwAPI.fetchAilments(httpClient);

  // Given ailment object, display corresponding icon
  _displayIcon(ailment) {
    if (ailment["name"] == 'Blastblight') {
      return const Image(
        image: AssetImage('assets/images/ailments/blastblight.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Bleeding') {
      return const Image(
        image: AssetImage('assets/images/ailments/bleeding.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Dragonblight') {
      return const Image(
        image: AssetImage('assets/images/ailments/dragonblight.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Effluvial Buildup') {
      return const Image(
        image: AssetImage('assets/images/ailments/effluvial_buildup.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Fireblight') {
      return const Image(
        image: AssetImage('assets/images/ailments/fireblight.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Iceblight') {
      return const Image(
        image: AssetImage('assets/images/ailments/iceblight.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Paralysis') {
      return const Image(
        image: AssetImage('assets/images/ailments/paralysis.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Poison') {
      return const Image(
        image: AssetImage('assets/images/ailments/poison.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Sleep') {
      return const Image(
        image: AssetImage('assets/images/ailments/sleep.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Stun') {
      return const Image(
        image: AssetImage('assets/images/ailments/stun.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Thunderblight') {
      return const Image(
        image: AssetImage('assets/images/ailments/thunderblight.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Waterblight') {
      return const Image(
        image: AssetImage('assets/images/ailments/waterblight.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Wind Pressure') {
      return const Image(
        image: AssetImage('assets/images/ailments/wind_pressure.png'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Defense Down') {
      return const Image(
        image: AssetImage('assets/images/ailments/defense_down.webp'),
        height: 50,
        width: 50,
      );
    } else if (ailment["name"] == 'Muddy') {
      return const Image(
        image: AssetImage('assets/images/ailments/muddy.webp'),
        height: 50,
        width: 50,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF70647d),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF70647d),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Ailments'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AilmentsScreen(title: 'Ailments')));
              },
            ),
            ListTile(
              title: const Text('Armor'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: FutureBuilder<List<dynamic>>(
        future: futureAilments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView(
                children: [
                  for (dynamic ailment in snapshot.data!)
                    ListTile(
                      title: Text(ailment["name"]),
                      leading: _displayIcon(ailment),
                      // subtitle: Text(ailment["description"]),
                    )
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            throw NullThrownError();
          }
        },
      )),
    );
  }
}
