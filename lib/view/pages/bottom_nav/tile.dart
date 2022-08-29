import 'package:flutter/material.dart';
import 'package:plane/model/account_model.dart';
import 'package:plane/model/modeling.dart';

class Tile extends StatelessWidget {
  final Accounts addcashing;
  const Tile(this.addcashing);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child
          : Card(shadowColor: Colors.black,
        elevation: 5.0,
        color: Colors.white70,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(addcashing.cash.toString(),
              style: TextStyle(fontSize: 23.0,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );




  }
}
