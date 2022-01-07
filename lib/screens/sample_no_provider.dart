import 'package:flutter/material.dart';

class SampleNoProvider extends StatelessWidget {
  const SampleNoProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Providerを使わないサンプル'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "準備中だよ！",
                style: TextStyle(fontSize: 40.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
