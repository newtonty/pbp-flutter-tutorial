import 'package:money_tracker/pages/menu.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {

  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [         
          ListTile(
            title: const Text('Menu'),
            onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            }
          ) 
        ],
      ),
    );
  }
}
