import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text('Close Menu'),
            onTap: () => {Navigator.pop(context)},
          ),
          DrawerHeader(
            child: const Text(
              'California\nEfficiency\nGroup',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w300,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: const AssetImage('./assets/images/nav-cover.jpg'),
                )),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Create Your Account'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
