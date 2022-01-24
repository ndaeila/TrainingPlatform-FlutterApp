import 'dart:io';

import 'package:californiaefficiencygroup/ui/common/nav-drawer.dart';
import 'package:californiaefficiencygroup/ui/home/home_controller.dart';
import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeState>();
    const titleMargin = 10;

    return Scaffold(
      drawer: NavDrawer(),
      onDrawerChanged: (isOpened) {
        context.read<HomeController>().setDrawerIsOpen(isOpened);
      },
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 2.0),
                blurRadius: 8.0,
              )
            ],
          ),
          child: AppBar(
            actions: [
              StatefulBuilder(
                builder: (context, setState) {
                  return MaterialButton(
                    child: Icon(
                      Icons.menu_rounded,
                      color: state.drawerIsOpen
                          ? Colors.transparent
                          : Colors.black,
                      size: 40,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    // splashColor: Colors.transparent,
                  );
                },
              )
            ],
            leadingWidth: 0,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: kIsWeb
                ? SizedBox(
                    height: kToolbarHeight - titleMargin,
                    child: Row(
                      children: [
                        Image.asset('./images/CEG-icon.png'),
                        const Text("  "),
                        Image.asset('./images/CEG-title.png'),
                      ],
                    ),
                  )
                : Platform.isAndroid || Platform.isIOS
                    ? Text("TODO: Implement android text")
                    : Text("IOS Text"),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: Stack(
        children: [
          Expanded(
            child: Chewie(
              controller: context.watch<HomeController>().chewieController!,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.bodyTextElement),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
