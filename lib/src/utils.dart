// lib/src/utils.dart

/// Returns the top [topN] indices from [scoreMap] based on their values in descending order.
List<int> getTopIndices(Map<int, double> scoreMap, int topN) {
  final entries = scoreMap.entries.toList();

  entries.sort((a, b) {
    final diff = b.value.compareTo(a.value);
    return diff != 0 ? diff : a.key.compareTo(b.key);
  });

  return entries.take(topN).map((e) => e.key).toList();
}

/// Normalizes a list of scores to the range [0, 1].
List<double> normalizeScores(List<double> scores) {
  if (scores.isEmpty) return [];

  final minVal = scores.reduce((a, b) => a < b ? a : b);
  final maxVal = scores.reduce((a, b) => a > b ? a : b);

  if ((maxVal - minVal).abs() < 1e-9) {
    return List.filled(scores.length, 1.0); // All same values
  }

  return scores.map((s) => (s - minVal) / (maxVal - minVal)).toList();
}
