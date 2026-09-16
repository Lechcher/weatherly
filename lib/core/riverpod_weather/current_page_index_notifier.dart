import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentPageIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void updatePageIndex(int index) {
    state = index;
  }
}
