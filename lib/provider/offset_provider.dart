import 'package:flutter_riverpod/flutter_riverpod.dart';

final offsetProvider = StateNotifierProvider<Offset, int>((ref) {
  return Offset(10);
});

class Offset extends StateNotifier<int> {
  Offset(this.delta) : super(0);

  final int delta;

  void increment() {
    state = state + delta;
  }

  void decrement() {
    state = state - delta;
  }

  void clear() {
    state = 0;
  }
}
