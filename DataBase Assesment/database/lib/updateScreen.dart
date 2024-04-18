import 'package:database/DataBaseHelper/DataBaseHelper.dart';
import 'package:database/DataBaseHelper/word.dart';
import 'package:flutter/material.dart';


class UpdateWordScreen extends StatefulWidget {
  final Word word;

  UpdateWordScreen({Key? key, required this.word}) : super(key: key);

  @override
  _UpdateWordScreenState createState() => _UpdateWordScreenState();
}

class _UpdateWordScreenState extends State<UpdateWordScreen> {
  late TextEditingController _meaningController;

  @override
  void initState() {
    super.initState();
    _meaningController = TextEditingController(text: widget.word.meaning);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Word'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.word.word),
            TextField(
              controller: _meaningController,
              decoration: InputDecoration(labelText: 'Meaning'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateWord(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateWord(BuildContext context) async {
    String meaning = _meaningController.text.trim();

    if (meaning.isNotEmpty) {
      Word updatedWord = Word(
        id: widget.word.id,
        word: widget.word.word,
        meaning: meaning,
      );
      await DatabaseHelper.instance.update(updatedWord.toMap() as Word);
      Navigator.pop(context); // Go back to previous screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the meaning.')),
      );
    }
  }
}
