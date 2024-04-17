import 'package:flutter/material.dart';

class ListViewWithContextMenu extends StatefulWidget {
  @override
  _ListViewWithContextMenuState createState() => _ListViewWithContextMenuState();
}

class _ListViewWithContextMenuState extends State<ListViewWithContextMenu> {
  List<String> names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Context Menu'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showDialog(names[index]);
                  },
                  onLongPress: () {
                    _showContextMenu(names[index]);
                  },
                  child: ListTile(
                    title: Text(names[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Enter a name'),
              onSubmitted: (value) {
                setState(() {
                  names.add(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Name'),
          content: Text(name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showContextMenu(String name) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(Offset.zero),
          overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Item'),
            onTap: () {
              _confirmDelete(name);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Item'),
            onTap: () {
              _editItem(name);
            },
          ),
        ),
      ],
    );
  }

  void _confirmDelete(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure want to delete $name?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  names.remove(name);
                });
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(String name) {
    TextEditingController textController = TextEditingController(text: name);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: 'Enter new name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  names[names.indexOf(name)] = textController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}