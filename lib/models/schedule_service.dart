import 'dart:async' show Future;
import 'package:droidknights/res/strings.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:droidknights/models/track_schedule.dart';

Map<String, List<ScheduleModel>> dataCache = Map();

Future<String> _loadAScheduleAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<ScheduleModel>> loadSchedule(String path) async {
  String jsonString = await _loadAScheduleAsset(path);
  final jsonResponse = json.decode(jsonString);
  ScheduleListModel schedule = new ScheduleListModel.fromJson(jsonResponse);
  return schedule.list;
}

List<ScheduleModel> getScheduleModel(String key) {
  return dataCache[key];
}

void loadJsonDatas() {
  loadSchedule(Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN1).then((value) {
    dataCache[Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN1] = value;
  });
  loadSchedule(Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN2).then((value) {
    dataCache[Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN2] = value;
  });
  loadSchedule(Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN3).then((value) {
    dataCache[Strings.SCHEDULE_TAB_JSON_TRACK_SCREEN3] = value;
  });
}