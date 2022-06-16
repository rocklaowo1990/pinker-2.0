import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';

class HistoryState {
  final _history = <ResourceData>[].obs;
  set history(List<ResourceData> value) => _history.value = value;
  List<ResourceData> get history => _history;
}
