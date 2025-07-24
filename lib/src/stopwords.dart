// lib/src/stopwords.dart

/// A manager for multilingual stopword sets.
class StopwordManager {
  static final StopwordManager _instance = StopwordManager._internal();

  final Map<String, Set<String>> _stopwordMap = {};

  factory StopwordManager() => _instance;

  StopwordManager._internal() {
    _stopwordMap['en'] = _englishStopwords;
    _stopwordMap['tr'] = _turkishStopwords;
  }

  /// Returns the stopword set for the specified language.
  Set<String> getStopwords(String languageCode) {
    return _stopwordMap[languageCode.toLowerCase()] ?? {};
  }

  /// Checks if [word] is a stopword in the given [languageCode].
  bool isStopword(String word, String languageCode) {
    return getStopwords(languageCode).contains(word.toLowerCase());
  }

  /// Adds a new language with its stopword list.
  void addLanguage(String languageCode, Set<String> stopwords) {
    _stopwordMap[languageCode.toLowerCase()] = stopwords;
  }

  /// Appends extra stopwords to an existing language.
  void extendStopwords(String languageCode, Set<String> extraWords) {
    final code = languageCode.toLowerCase();
    _stopwordMap.putIfAbsent(code, () => {});
    _stopwordMap[code]!.addAll(extraWords.map((e) => e.toLowerCase()));
  }
}

/// Global shortcut method for convenience
bool isStopword(String word, String language) {
  return StopwordManager().isStopword(word, language);
}

// English stopword list
final Set<String> _englishStopwords = {
  'a', 'about', 'above', 'after', 'again', 'against', 'all', 'am', 'an', 'and', 'any', 'are',
  'as', 'at', 'be', 'because', 'been', 'before', 'being', 'below', 'between', 'both', 'but',
  'by', 'could', 'did', 'do', 'does', 'doing', 'down', 'during', 'each', 'few', 'for', 'from',
  'further', 'had', 'has', 'have', 'having', 'he', 'her', 'here', 'hers', 'herself', 'him',
  'himself', 'his', 'how', 'i', 'if', 'in', 'into', 'is', 'it', 'its', 'itself', 'just',
  'me', 'more', 'most', 'my', 'myself', 'no', 'nor', 'not', 'of', 'off', 'on', 'once',
  'only', 'or', 'other', 'our', 'ours', 'ourselves', 'out', 'over', 'own', 'same', 'she',
  'should', 'so', 'some', 'such', 'than', 'that', 'the', 'their', 'theirs', 'them',
  'themselves', 'then', 'there', 'these', 'they', 'this', 'those', 'through', 'to',
  'too', 'under', 'until', 'up', 'very', 'was', 'we', 'were', 'what', 'when', 'where',
  'which', 'while', 'who', 'whom', 'why', 'will', 'with', 'you', 'your', 'yours',
  'yourself', 'yourselves'
};

// Turkish stopword list
final Set<String> _turkishStopwords = {
  'acaba', 'ama', 'aslında', 'az', 'bazı', 'belki', 'bile', 'bir', 'biraz', 'birçoğu', 'birçok',
  'biz', 'bize', 'bizi', 'bizim', 'bu', 'buna', 'bunda', 'bunu', 'burada', 'çok', 'çünkü',
  'da', 'daha', 'de', 'defa', 'diğer', 'diye', 'en', 'gibi', 'hem', 'hep', 'hepsi', 'her',
  'hiç', 'için', 'ile', 'ise', 'kez', 'ki', 'kim', 'mı', 'mu', 'mü', 'nasıl', 'ne', 'neden',
  'nerde', 'nerede', 'nereye', 'niçin', 'niye', 'o', 'sanki', 'şey', 'siz', 'şu', 'tüm', 've',
  'veya', 'ya', 'yani', 'zaten', 'ben', 'sen', 'onlar', 'oldu', 'vardı', 'yoktu',
  'olmaz', 'olsun', 'olarak', 'ettim', 'etti', 'eder', 'ediyor', 'etmek', 'yapmak',
  'kadar', 'göre', 'biri', 'artık', 'hala'
};
