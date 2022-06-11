import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mhwdb_app/utils/ailment.dart';
import 'package:flutter_mhwdb_app/screens/ailment_list_screen.dart';
import 'package:flutter_mhwdb_app/utils/item.dart';
import 'package:flutter_mhwdb_app/utils/ui_methods.dart';

class AilmentScreen extends StatelessWidget {
  const AilmentScreen({Key key, this.ailment, this.title}) : super(key: key);
  final Ailment ailment;
  final String title;

  _displayActions() {
    if (ailment.recov.actions.isEmpty) {
      return Container(
          padding: const EdgeInsets.all(8.0), child: const Text("No Actions"));
    } else {
      return GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 3 / 1,
          children: <Widget>[
            for (String action in ailment.recov.actions)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: roundedBox(),
                  child: Text(
                    action,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ]);
    }
  }

  _displayItems() {
    if (ailment.recov.items.isEmpty) {
      return Container(
          padding: const EdgeInsets.all(8.0), child: const Text("No Items"));
    } else {
      return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 3 / 1,
          children: <Widget>[
            for (Item item in ailment.recov.items)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: roundedBox(),
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.black),
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
          ]);
    }
  }

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
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ailment.displayIcon(ailment.name, 150, 150)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: roundedBox(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
                    child: Text(
                      ailment.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF70647d),
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(ailment.desc),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: roundedBox(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0, bottom: 2.0),
                    child: Text(
                      "Recovery",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF70647d),
                    thickness: 2.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      "Action",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _displayActions(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Text(
                      "Items",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _displayItems(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
