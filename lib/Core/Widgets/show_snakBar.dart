import 'package:flutter/material.dart';

void showSnakBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('hi iam SnakBar I Appear In Error ')));
}
