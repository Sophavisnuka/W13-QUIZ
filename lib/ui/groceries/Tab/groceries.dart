import 'package:flutter/material.dart';
import 'package:w13_quiz/ui/groceries/Tab/search.dart';
import 'package:flutter/material.dart';
import '../../../data/mock_grocery_repository.dart';
import '../../../models/grocery.dart';
import '../grocery_form.dart';


class GroceryDetail extends StatefulWidget {
  const GroceryDetail({super.key, required this.groceryId});
  final String groceryId;

  @override
  State<GroceryDetail> createState() => _GroceryDetailState();
}

enum GroceryTab { search, groceries }

class _GroceryDetailState extends State<GroceryDetail> {

  GroceryTab currentTab = GroceryTab.groceries;
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      //  Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (context, index) =>
            GroceryTile(grocery: dummyGroceryItems[index]),
      );
    }
    return Scaffold(
      // appBar: AppBar(title: Text('Cl ${widget.groceryId}')),
      body: IndexedStack(
        index: currentTab.index,
        children: [
          GrocerySearch(grocerySearchId: widget.groceryId),
          content,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab.index,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            currentTab = GroceryTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search), 
            label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Groceries',
          ),
        ],
      ),
    );
  }
}
class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
