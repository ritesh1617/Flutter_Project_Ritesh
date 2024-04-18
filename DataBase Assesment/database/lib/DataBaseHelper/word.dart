class Word {
  int? id; // Make id nullable

  String word;
  String meaning;

  Word({
    this.id, // Add id parameter to the constructor
    required this.word,
    required this.meaning,
  });

  // Convert a Word object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include id in the map
      'word': word,
      'meaning': meaning,
    };
  }
}
