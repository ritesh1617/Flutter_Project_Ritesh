import 'package:database/DataBaseHelper/DataBaseHelper.dart';
import 'package:database/DataBaseHelper/word.dart';
import 'package:flutter/material.dart';


class AddWordScreen extends StatelessWidget {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Word'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _wordController,
              decoration: InputDecoration(labelText: 'Word'),
            ),
            TextField(
              controller: _meaningController,
              decoration: InputDecoration(labelText: 'Meaning'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addWord(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _addWord(BuildContext context) async {
    String word = _wordController.text.trim();
    String meaning = _meaningController.text.trim();

    if (word.isNotEmpty && meaning.isNotEmpty) {
      Word newWord = Word(word: word, meaning: meaning, );
      await DatabaseHelper.instance.insert(newWord.toMap() as Word);
      Navigator.pop(context); // Go back to previous screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both word and meaning.')),
      );
    }
  }
}
