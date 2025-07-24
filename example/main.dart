// example/main.dart

import 'package:ml_text_summarizer/ml_text_summarizer.dart';

void main() {
  final summarizerEn = TextSummarizer(
    maxSentences: 2,
    language: 'en',
  );

  final summarizerTr = TextSummarizer(
    maxSentences: 2,
    language: 'tr',
  );

  const englishText = '''
Artificial Intelligence (AI) is revolutionizing the world by enabling machines to learn from data.
It helps in automating complex tasks, making decisions faster, and improving productivity.
AI is already widely used in healthcare, finance, transportation, and many other industries.
However, it also raises ethical concerns regarding privacy, bias, and accountability.
As technology evolves, responsible AI development becomes increasingly important.
''';

  const turkishText = '''
Yapay zeka, makinelerin verilerden öğrenmesini sağlayarak dünyayı dönüştürüyor.
Bu teknoloji, karmaşık görevlerin otomatikleştirilmesine, daha hızlı karar alınmasına ve verimliliğin artırılmasına yardımcı oluyor.
Yapay zeka, sağlık, finans, ulaşım ve daha birçok alanda zaten yaygın olarak kullanılıyor.
Ancak, gizlilik, önyargı ve hesap verebilirlik gibi etik kaygılar da gündeme geliyor.
Teknoloji geliştikçe, sorumlu yapay zeka geliştirme daha da önemli hale geliyor.
''';

  print('🔹 English Summary:\n${summarizerEn.summarize(englishText)}\n');
  print('🔹 Turkish Summary:\n${summarizerTr.summarize(turkishText)}\n');
}
