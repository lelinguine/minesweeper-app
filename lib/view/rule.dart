import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';
import 'package:minesweeper/component/input/select.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/game.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/game.dart';

class MyRule extends StatelessWidget {
  const MyRule({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

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
                child: Text(
                  context.customRule,
                  style: Theme.of(context).textTheme.bodyMedium,
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
                      action: () => game.updateDifficulty(),
                      child: const MySelect(
                        icon: 'change.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      action: () => pushOptions(context, MyGame()),
                      child: const MyAction(
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
