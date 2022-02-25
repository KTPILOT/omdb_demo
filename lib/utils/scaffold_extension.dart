import 'package:flutter/material.dart';

extension ScaffoldExtension on Widget {
  appBarScaffold({required BuildContext context, required String title}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
