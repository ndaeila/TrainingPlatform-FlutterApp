import 'dart:io';

import 'package:californiaefficiencygroup/ui/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:californiaefficiencygroup/commons/widgets/get-text.dart';
import 'package:californiaefficiencygroup/commons/widgets/nav-drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeState>();
    const titleMargin = 10;

    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 2.0),
              blurRadius: 8.0,
            )
          ]),
          child: AppBar(
            elevation: 0.0,
            title: Platform.isAndroid || Platform.isIOS
                ? Text("TODO: Implement")
                : SizedBox(
                    height: kToolbarHeight - titleMargin,
                    child: Flexible(
                      child: Row(
                        children: [
                          Image.asset('./images/CEG-icon.png'),
                          const Text("  "),
                          Image.asset('./images/CEG-title.png'),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.bodyTextElement),
          ],
        ),
      ),
    );
  }
}
