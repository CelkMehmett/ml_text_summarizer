// lib/src/summarizer.dart

import 'tokenizer.dart';
import 'stopwords.dart';
import 'utils.dart';

/// [TextSummarizer] is a simple frequency-based extractive summarizer.
/// It selects the most important sentences from the input text based on word frequency.
class TextSummarizer {
  /// Maximum number of sentences to include in the summary.
  final int maxSentences;

  /// Language code (e.g., "en", "tr") for stopword filtering.
  final String language;

  TextSummarizer({
    this.maxSentences = 3,
    this.language = 'en',
  });

  /// Summarizes the given [text] by extracting the top-scoring sentences.
  String summarize(String text) {
    if (text.trim().isEmpty) return '';

    final sentences = splitSentences(text);
    if (sentences.length <= maxSentences) return text;

    final wordList = sentences.map((s) => tokenizeWords(s, language)).toList();

    final freqMap = _computeWordFrequencies(wordList);

    final sentenceScores = <int, double>{};
    for (int i = 0; i < sentences.length; i++) {
      final words = wordList[i];
      double score = 0;
      for (final word in words) {
        score += freqMap[word.toLowerCase()] ?? 0.0;
      }
      sentenceScores[i] = score / (words.length + 1e-5); // normalize by length
    }

    final topIndexes = getTopIndices(sentenceScores, maxSentences);
    topIndexes.sort();

    return topIndexes.map((i) => sentences[i]).join(' ').trim();
  }

  /// Computes normalized word frequencies across all sentences.
  Map<String, double> _computeWordFrequencies(List<List<String>> wordList) {
    final Map<String, int> freq = {};

    for (final words in wordList) {
      for (final word in words) {
        final lower = word.toLowerCase();
        if (!isStopword(lower, language)) {
          freq[lower] = (freq[lower] ?? 0) + 1;
        }
      }
    }

    final maxFreq = freq.isEmpty ? 1 : freq.values.reduce((a, b) => a > b ? a : b);
    return freq.map((k, v) => MapEntry(k, v / maxFreq));
  }
}
