import 'package:database/DataBaseHelper/DataBaseHelper.dart';
import 'package:database/DataBaseHelper/word.dart';
import 'package:database/updateScreen.dart';
import 'package:flutter/material.dart';


class ViewWordsScreen extends StatefulWidget {
  @override
  _ViewWordsScreenState createState() => _ViewWordsScreenState();
}

class _ViewWordsScreenState extends State<ViewWordsScreen> {
  late Future<List<Word>> _wordListFuture;

  @override
  void initState() {
    super.initState();
    _wordListFuture = _getWordList();
  }

  Future<List<Word>> _getWordList() async {
    return await DatabaseHelper.instance.queryAllWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Words'),
      ),
      body: FutureBuilder<List<Word>>(
        future: _wordListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Word>? words = snapshot.data;
            return ListView.builder(
              itemCount: words?.length,
              itemBuilder: (context, index) { 
                Word word = words![index];
                return ListTile(
                  title: Text(word.word),
                  subtitle: Text(word.meaning),
                  onTap: () {
                    // Navigate to update word screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateWordScreen(word: word),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
