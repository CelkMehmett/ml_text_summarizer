// test/summarizer_test.dart

import 'package:test/test.dart';
import 'package:ml_text_summarizer/ml_text_summarizer.dart';

void main() {
  group('TextSummarizer', () {
    late TextSummarizer summarizerEn;
    late TextSummarizer summarizerTr;

    setUp(() {
      summarizerEn = TextSummarizer(maxSentences: 2, language: 'en');
      summarizerTr = TextSummarizer(maxSentences: 2, language: 'tr');
    });

    test('summarizes English text correctly', () {
      const text = '''
      Artificial Intelligence is transforming industries.
      It enables automation and intelligent decision-making.
      AI is used in healthcare, finance, and robotics.
      ''';

      final summary = summarizerEn.summarize(text);
      expect(summary.split('.').length, lessThanOrEqualTo(3)); // 2 sentences + final dot
      expect(summary.toLowerCase(), contains('artificial intelligence'));
    });

    test('summarizes Turkish text correctly', () {
      const text = '''
      Yapay zeka, birçok sektörü dönüştürüyor.
      Karar verme süreçlerini hızlandırıyor.
      Sağlık ve eğitim gibi alanlarda etkili kullanılıyor.
      ''';

      final summary = summarizerTr.summarize(text);
      expect(summary.split('.').length, lessThanOrEqualTo(3)); // 2 sentences + final dot
      expect(summary.toLowerCase(), contains('yapay zeka'));
    });

    test('returns original text if sentence count is below limit', () {
      const shortText = 'Flutter is great.';

      final summary = summarizerEn.summarize(shortText);
      expect(summary, shortText);
    });

    test('returns empty string for empty input', () {
      const empty = '   ';
      expect(summarizerEn.summarize(empty), '');
    });
  });
}
