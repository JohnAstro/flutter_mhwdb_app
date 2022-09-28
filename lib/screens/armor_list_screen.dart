import 'package:flutter/material.dart';
import 'package:flutter_mhwdb_app/config/globals.dart';
import 'package:flutter_mhwdb_app/screens/ailment_list_screen.dart';
import 'package:flutter_mhwdb_app/screens/armor_screen.dart';
import 'package:flutter_mhwdb_app/utils/armor.dart';
import 'package:flutter_mhwdb_app/utils/mhw_db_api.dart';

class ArmorListScreen extends StatefulWidget {
  const ArmorListScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<ArmorListScreen> createState() => _ArmorListScreenState();
}

class _ArmorListScreenState extends State<ArmorListScreen> {
  Future<List<Armor>> futureArmors = MhwAPI.fetchArmors(httpClient);

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
                            const AilmentListScreen(title: 'Ailments')));
              },
            ),
            ListTile(
              title: const Text('Armor'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ArmorListScreen(title: 'Armor')));
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: FutureBuilder<List<Armor>>(
        future: futureArmors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView(
                children: [
                  for (Armor armor in snapshot.data)
                    ListTile(
                      title: Text(armor.name),
                      // leading: armors.displayIcon(ailment.name, 50, 50),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArmorScreen(
                                      armor: armor,
                                      title: "Armor",
                                    )));
                      },
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
