// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:universal_io/io.dart';

import "package:whisper_dart/api/api.dart" as whisper_api;

class WhisperRequest {
  Map rawData;
  WhisperRequest(this.rawData);

  factory WhisperRequest.getVersion() {
    return WhisperRequest(whisper_api.GetVersion.create(
      special_type: "getVersion",
    ).toJson());
  }

  factory WhisperRequest.fromWavFile({
    required File audio,
    required File model,
    bool is_translate = false,
    int threads = 4,
    bool is_verbose = false,
    String language = "id",
    bool is_special_tokens = false,
    bool is_no_timestamps = false,
  }) {
    return WhisperRequest(whisper_api.GetTextFromWavFile.create(
      special_type: "getTextFromWavFile",
      is_translate: is_translate,
      threads: threads,
      is_verbose: is_verbose,
      language: language,
      is_special_tokens: is_special_tokens,
      is_no_timestamps: is_no_timestamps,
      audio: audio.path,
      model: model.path,
    ).toJson());
  }

  Map toMap() {
    return (rawData);
  }

  Map toJson() {
    return (rawData);
  }

  @override
  String toString() {
    return json.encode(rawData);
  }
}
