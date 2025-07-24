// lib/src/tokenizer.dart

/// Splits the input [text] into sentences using basic punctuation and capitalization rules.
List<String> splitSentences(String text) {
  final regex = RegExp(r'(?<=[.!?])\s+(?=[A-ZİĞÜŞÖÇ])', unicode: true);
  return text
      .trim()
      .split(regex)
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();
}

/// Tokenizes a sentence into words, removes punctuation and numbers.
List<String> tokenizeWords(String sentence, String language) {
  final cleaned = _cleanText(sentence);
  return cleaned
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty && word.length > 1)
      .toList();
}

/// Removes punctuation, numbers, and special characters.
String _cleanText(String text) {
  final lowercase = text.toLowerCase();
  final removedPunct = lowercase.replaceAll(RegExp(r'[^\w\sçğıöşüÇĞİÖŞÜ]', unicode: true), '');
  final removedNumbers = removedPunct.replaceAll(RegExp(r'\d+'), '');
  return removedNumbers;
}
