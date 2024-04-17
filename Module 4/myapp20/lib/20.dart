import 'package:flutter/material.dart';

class ContextMenuExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Menu Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showContextMenu(context);
          },
          child: Text('Open Context Menu'),
        ),
      ),
    );
  }

  void _showContextMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final selectedOption = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset.zero,
          Offset(50, 50),
        ),
        Offset.zero & overlay.size,
      ),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'edit',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'view',
          child: ListTile(
            leading: Icon(Icons.visibility),
            title: Text('View'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
    );

    // Handle the selected option
    if (selectedOption != null) {
      switch (selectedOption) {
        case 'edit':
          // Perform edit action
          break;
        case 'view':
          // Perform view action
          break;
        case 'delete':
          // Perform delete action
          break;
      }
    }
  }
}