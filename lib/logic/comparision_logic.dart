import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vibration/vibration.dart';

Future<Map<String, dynamic>> _getFirebaseWordMap() async {
  final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance
          .collection('Words')
          .doc('wordMapDoc')
          .get();

  if (snapshot.exists) {
    final data = snapshot.data()!;
    final wordMap = data['words'] as Map<String, dynamic>;
    return wordMap;
  }

  return {};
}

void checkWordMatch(String spokenSentence) async {
  final wordMap = await _getFirebaseWordMap();
  final spokenWords = spokenSentence.toLowerCase().split(' ');

  for (final word in spokenWords) {
    if (wordMap.containsKey(word)) {
      wordMap[word] = (wordMap[word] as int) + 1; // Incrementing the counter
      if (await Vibration.hasVibrator() == true) {
        Vibration.vibrate(duration: 500);
      }
    }
  }

  await FirebaseFirestore.instance
      .collection('Words')
      .doc('wordMapDoc')
      .update({'words': wordMap});
}
