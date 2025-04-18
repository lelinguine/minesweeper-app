import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/mygamemanager.dart';

import 'package:minesweeper/view/component/input/mybutton.dart';
import 'package:minesweeper/view/component/input/mydefaultbutton.dart';
import 'package:minesweeper/view/component/input/myselectbutton.dart';

import 'package:minesweeper/view/mynavigate.dart';
import 'package:minesweeper/view/mygame.dart';

class MyRule extends StatelessWidget {
  const MyRule({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<MyGameManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.customRule,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyButton(
                      color: Theme.of(context).secondaryHeaderColor,
                      action: () => manager.updateDifficulty(),
                      child: const MySelect(
                        icon: 'change.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      color: Theme.of(context).secondaryHeaderColor,
                      action: () => pushOptions(context, MyGame()),
                      child: const MyDefault(
                        title: 'Understand',
                        icon: 'check.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
