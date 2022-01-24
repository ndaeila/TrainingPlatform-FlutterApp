import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  AssetImage navCoverImage = const AssetImage('assets/images/nav-cover.jpg');

  NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.close,
              color: Colors.black,
            ),
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
                      Colors.white.withOpacity(0.5), BlendMode.dstATop),
                  image: navCoverImage,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).popAndPushNamed('/home'),
          ),
          ListTile(
            leading: const Icon(Icons.quiz),
            title: const Text('Tutorial'),
            onTap: () => Navigator.of(context).popAndPushNamed('/tutorial'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Create Your Account'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
