import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item> items = [
    Item("Item 1"),
    Item("Item 2"),
    Item("Item 3"),
    Item("Item 4"),
    Item("Item 5"),
  ];

  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            tileColor: items[index].selected ? Colors.blue : null,
            onTap: () {
              setState(() {
                items[index].selected = !items[index].selected;
                if (items[index].selected) {
                  selectedCount++;
                } else {
                  selectedCount--;
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectionDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: Text('Number of selected items: $selectedCount'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Item {
  final String name;
  bool selected;

  Item(this.name, {this.selected = false});
}