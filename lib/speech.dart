import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Speech {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording(
      {required Function(String text) onResult,
      required ValueChanged<bool> onListening}) async {
    final isAvailable = await _speech.initialize(
        onStatus: (status) => onListening(_speech.isListening),
        onError: (error) => print('Error $error'));

    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    if (isAvailable) {
      _speech.listen(
        
        localeId: 'en_IN',
        listenMode: ListenMode.dictation,
        partialResults: false,
        onResult: (value) => onResult(value.recognizedWords),
      );
    }

    return isAvailable;
  }

  static void stop() {
    _speech.stop();
  }
}
