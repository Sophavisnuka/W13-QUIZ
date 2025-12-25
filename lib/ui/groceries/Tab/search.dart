import 'package:flutter/material.dart';

class GrocerySearch extends StatefulWidget {
  const GrocerySearch({super.key, required this.grocerySearchId});
  final String grocerySearchId;
  @override
  State<GrocerySearch> createState() => _GrocerySearchState();
}

class _GrocerySearchState extends State<GrocerySearch> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}