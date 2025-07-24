
# 📄 ml_text_summarizer

[![Pub Version](https://img.shields.io/pub/v/ml_text_summarizer.svg)](https://pub.dev/packages/ml_text_summarizer)
[![Dart](https://img.shields.io/badge/dart-compatible-blue.svg)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A lightweight, multilingual **extractive text summarizer** written in pure Dart.  
It supports **English** 🇺🇸 and **Turkish** 🇹🇷 by default and is easily extensible to other languages.

---

## ✨ Features

- ✅ Extractive text summarization
- 🌍 Multilingual stopword support (English & Turkish included)
- ⚙️ Pure Dart implementation – no native dependencies
- 🧩 Easily extensible stopword manager
- 🧪 Unit tested
- 🚀 pub.dev-ready

---

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  ml_text_summarizer: ^1.0.0
```

Then run:

```bash
dart pub get
```

---

## 🚀 Usage

```dart
import 'package:ml_text_summarizer/ml_text_summarizer.dart';

void main() {
  final summarizer = TextSummarizer(
    maxSentences: 2,
    language: 'en', // or 'tr' for Turkish
  );

  const text = '''
  Artificial Intelligence is transforming the world by enabling machines to learn from data.
  It helps automate tasks, speed up decision-making, and improve productivity.
  AI is used in healthcare, finance, education, and more.
  ''';

  final summary = summarizer.summarize(text);
  print('Summary:');
  print(summary);
}
```

---

## 🧪 Running Tests

```bash
dart test
```

---

## 📚 Example Output

**Input:**

> "Artificial Intelligence is transforming industries. It enables automation and intelligent decision-making. AI is used in healthcare, finance, and robotics."

**Summary:**

> "Artificial Intelligence is transforming industries. It enables automation and intelligent decision-making."

---

## 🔧 Extending to Other Languages

You can register your own stopword list:

```dart
StopwordManager().addLanguage('es', {'el', 'la', 'de', 'que', 'y'});
```

---

## 📄 License

MIT © 2025 Mehmet Çelik

---

## 🌐 Links

- [Pub.dev Page](https://pub.dev/packages/ml_text_summarizer)
- [GitHub Repo](https://github.com/CelkMehmett/ml_text_summarizer)