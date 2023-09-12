import 'dart:io';

import 'package:<name>/ui/common/nav-drawer.dart';
import 'package:<name>/ui/home/home_controller.dart';
import 'package:<name>/ui/home/home_state.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeState>();
    const titleMargin = 10;
    final controller = context.read<HomeController>();

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
                        Image.asset('./images/<name>-icon.png'),
                        const Text("  "),
                        Image.asset('./images/<name>-title.png'),
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
            child: context.watch<HomeController>().chewieController == null ? Container() : Chewie(
              controller: controller.chewieController!,
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
