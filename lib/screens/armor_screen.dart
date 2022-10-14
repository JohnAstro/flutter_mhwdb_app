import 'package:flutter/material.dart';
import 'package:flutter_mhwdb_app/screens/ailment_list_screen.dart';
import 'package:flutter_mhwdb_app/utils/armor.dart';
import 'package:flutter_mhwdb_app/utils/ui_methods.dart';

class ArmorScreen extends StatelessWidget {
  const ArmorScreen({Key key, this.armor, this.title}) : super(key: key);
  final Armor armor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF70647d),
        title: Text(title),
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
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: ListView(
        children: [
          // Poison Box
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${armor.defense.base}")),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: roundedBox(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
                    child: Text(
                      armor.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF70647d),
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(armor.name),
                  ),
                ],
              ),
            ),
          ),
          // Recovery Box
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: roundedBox(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 6.0, bottom: 2.0),
                    child: Text(
                      "Recovery",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    color: Color(0xFF70647d),
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      "Action",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //_displayActions(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      "Items",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //_displayItems(ailment.recov.items),
                ],
              ),
            ),
          ),
          // Protection Box
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: roundedBox(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 6.0, bottom: 2.0),
                    child: Text(
                      "Protection",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    color: Color(0xFF70647d),
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      "Items",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // _displayItems(ailment.protection.items),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      "Skills",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //_displaySkills(ailment.protection.skills),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
