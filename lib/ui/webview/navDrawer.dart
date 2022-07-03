import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            // leading: Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}