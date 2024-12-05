class AdaptiveGridSize {
  AdaptiveGridSize(this.columnCount, this.aspectRatio);

  int columnCount = 0;
  double aspectRatio = 1;
}

AdaptiveGridSize getAdaptiveGridSize(double width) {
  int columnCount = 0;
  double aspectRatio = 1;
  if (width > 1280) {
    columnCount = 3;
    aspectRatio = 2.4;
  } else if (width > 1080) {
    columnCount = 3;
    aspectRatio = 1.5;
  } else if (width > 800) {
    columnCount = 2;
    aspectRatio = 2;
  } else if (width > 720) {
    columnCount = 2;
    aspectRatio = 1.5;
  } else if (width > 480) {
    columnCount = 0;
    aspectRatio = 1;
  }
  return AdaptiveGridSize(columnCount, aspectRatio);
}
