import 'package:flutter/material.dart';
import 'package:flutter_mhwdb_app/utils/ailment.dart';
import 'package:flutter_mhwdb_app/screens/ailment_list_screen.dart';

class AilmentScreen extends StatelessWidget {
  const AilmentScreen({Key key, this.ailment, this.title}) : super(key: key);
  final Ailment ailment;
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
          Padding(
              padding: const EdgeInsets.all(10),
              child: ailment.displayIcon(ailment.name, 150, 150)),
          Text(
            ailment.name,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            ailment.desc,
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Recovery",
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            "Action:",
            style: TextStyle(fontSize: 20),
          ),
          for (String action in ailment.rec.actions) Text(action)
        ],
      )),
    );
  }
}
