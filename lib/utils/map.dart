int map(int value, actualMin, actualMax, futureMin, futureMax) {
  return ((value - actualMin) *
              (futureMax - futureMin) /
              (actualMax - actualMin) +
          futureMin)
      .toInt();
}
