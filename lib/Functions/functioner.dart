class Functioner {
  void undo(List x, List y) {
    x.clear();
    for (int i = 0; i < y.length; i++) {
      y[i] = false;
    }
  }
}
