import 'package:flutter/material.dart';

class GroceryTab extends StatefulWidget {
  const GroceryTab({super.key, required this.groceryTabId});
  final String groceryTabId;

  @override
  State<GroceryTab> createState() => _GroceryTabState();
}

class _GroceryTabState extends State<GroceryTab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}