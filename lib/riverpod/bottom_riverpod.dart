import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifer extends StateNotifier<int> {
  IndexNotifer() : super(0);
  set value(int index) => state = index;
}

final navNotifer =
    StateNotifierProvider<IndexNotifer, int>((ref) => IndexNotifer());
